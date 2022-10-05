import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';
import 'package:flutter_presensi_dsn/ui/home/home_page.dart';
import 'package:flutter_presensi_dsn/ui/login/login_page.dart';
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
        BlocProvider(
          create: (_) => _authBloc,
        ),
        BlocProvider(
          create: (_) => _splashBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            if (state.isHasAuth &&
                state.isSuccess &&
                state.successType == AuthStateSuccessType.authFound) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomePage()));
            } else if (state.error.isNotEmpty &&
                !state.isSuccess &&
                state.errorType == AuthStateErrorType.authNotFound) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPage()));
            }
          }),
          BlocListener<SplashBloc, SplashState>(listener: (context, state) {
            bool? isFirstTime = state.isFirstTime;
            if (isFirstTime != null) {
              if (isFirstTime) {
                log('$runtimeType : ready to welcome page');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const WelcomePage()));
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
                const SizedBox(height: 20.0),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, authstate) {
                    return BlocBuilder<SplashBloc, SplashState>(
                      builder: (context, splashstate) {
                        return authstate.isLoading || splashstate.isLoading
                            ? const CircularProgressIndicator(
                                color: kPrimaryButtonColor,
                              )
                            : Container();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
