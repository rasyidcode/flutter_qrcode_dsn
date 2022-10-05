import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/login/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final String user;
  final String pass;
  const LoginButton({required this.user, required this.pass, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (user.isNotEmpty && pass.isNotEmpty) {
          BlocProvider.of<LoginBloc>(context).doLogin(user, pass);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please provide username or password')));
        }
      },
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      color: kPrimaryButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
