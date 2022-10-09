import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';
import 'package:flutter_presensi_dsn/ui/home/home_bloc.dart';
import 'package:flutter_presensi_dsn/ui/home/home_state.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/home_content.dart';
import 'package:flutter_presensi_dsn/ui/home/widgets/me_content.dart';
import 'package:flutter_presensi_dsn/ui/login/login_page.dart';
import 'package:kiwi/kiwi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = KiwiContainer().resolve<HomeBloc>();
  final AuthBloc _authBloc = KiwiContainer().resolve<AuthBloc>();
  int _selectedIndex = 0;

  static const List<Widget> _contentOptions = [HomeContent(), MeContent()];

  @override
  void initState() {
    _authBloc.getAuth();
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (_) => _homeBloc),
        BlocProvider<AuthBloc>(create: (_) => _authBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(listener: (context, state) {
            if (state.isSuccess) {
              if ((state.successType == HomeStateSuccessType.postQr ||
                      state.successType ==
                          HomeStateSuccessType.submitPerkuliahan) &&
                  state.message.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                    ),
                  ),
                );
              }
            }

            if (state.error.isNotEmpty) {
              if (state.errorType == HomeStateErrorType.expiredToken) {
                // request new token
                AuthLocal auth = BlocProvider.of<AuthBloc>(context).state.auth;
                BlocProvider.of<AuthBloc>(context).renewToken(auth);
              }

              if (state.errorType == HomeStateErrorType.apiError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              } else {
                log('$runtimeType : ${state.error}');
              }
            }
          }),
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            if (state.isSuccess) {
              if (state.successType == AuthStateSuccessType.tokenRenewed ||
                  state.successType == AuthStateSuccessType.authFound) {
                String? accessToken = state.auth.accessToken;
                if (accessToken != null) {
                  BlocProvider.of<HomeBloc>(context).getListMatkul(accessToken);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Something went wrong')));
                }
              }

              if (state.successType == AuthStateSuccessType.logoutSucceed) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginPage()));
              }
            }

            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          }),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: const Text('Home Page'),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: _contentOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 12.0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined), label: 'Me'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: kPrimaryColor,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
