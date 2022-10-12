import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/login/login_page.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_bloc.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_state.dart';
import 'package:flutter_presensi_dsn/ui/welcome/widgets/start_button.dart';
import 'package:kiwi/kiwi.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomeBloc _welcomeBloc = KiwiContainer().resolve<WelcomeBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _welcomeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _welcomeBloc,
      child: BlocListener<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const LoginPage()));
          }
        },
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Spacer(),
                Image.asset('assets/logo_dsn.png'),
                const SizedBox(height: 8.0),
                Text(
                  'Aplikasi QRCode Dosen',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Selamat Datang Di Aplikasi QRCode Dosen untuk STMIK Adhi Guna Palu',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                ),
                const Spacer(),
                const StartButton(),
                const SizedBox(height: 8.0),
                // const
              ],
            ),
          ),
        ),
      ),
    );
  }
}
