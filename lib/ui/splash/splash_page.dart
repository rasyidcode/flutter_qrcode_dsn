import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';
import 'package:flutter_presensi_dsn/ui/splash/splash_bloc.dart';
import 'package:flutter_presensi_dsn/ui/splash/splash_state.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_page.dart';
import 'package:kiwi/kiwi.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthBloc _authBloc = KiwiContainer().resolve<AuthBloc>();
  final SplashBloc _splashBloc = KiwiContainer().resolve<SplashBloc>();

  @override
  void initState() {
    _splashBloc.checkFirstTime();
    super.initState();
  }

  @override
  void dispose() {
    _splashBloc.close();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => _authBloc),
        BlocProvider<SplashBloc>(create: (_) => _splashBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {}),
          BlocListener<SplashBloc, SplashState>(listener: (context, state) {
            bool? isFirstTime = state.isFirstTime;
            if (isFirstTime != null) {
              if (isFirstTime) {
                Timer(const Duration(seconds: 2), () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const WelcomePage()));
                });
              } else {
                BlocProvider.of<AuthBloc>(context).getAuth();
              }
            }
          }),
        ],
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset('assets/logo_dsn.png'),
                ),
                Column(
                  children: const [
                    SizedBox(height: 20.0),
                    CircularProgressIndicator(
                      color: kPrimaryButtonColor,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Loading...',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
