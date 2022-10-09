import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/constants.dart';
import 'package:flutter_presensi_dsn/ui/home/home_page.dart';
import 'package:flutter_presensi_dsn/ui/login/login_bloc.dart';
import 'package:flutter_presensi_dsn/ui/login/login_state.dart';
import 'package:flutter_presensi_dsn/ui/login/widgets/login_button.dart';
import 'package:kiwi/kiwi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = KiwiContainer().resolve<LoginBloc>();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordextController = TextEditingController();
  bool _isUsernameFocused = false;
  bool _isPasswordFocused = false;
  bool _showPassword = false;

  @override
  void initState() {
    _usernameFocusNode.addListener(() {
      setState(() {
        _isUsernameFocused = _usernameFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _usernameFocusNode.removeListener(() {
      setState(() {
        _isUsernameFocused = _usernameFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.removeListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
    _loginBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomePage()));
          }

          if (state.error.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Halo Dosen, silahkan masukkan username dan password dibawah!',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _usernameTextController,
                              style: TextStyle(
                                color:
                                    _isUsernameFocused ? kPrimaryColor : null,
                              ),
                              keyboardType: TextInputType.number,
                              focusNode: _usernameFocusNode,
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  labelText: 'Username',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: _isUsernameFocused
                                        ? kPrimaryColor
                                        : null,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Colors.black12,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never),
                            ),
                            const SizedBox(height: 16.0),
                            TextField(
                              controller: _passwordextController,
                              style: TextStyle(
                                color:
                                    _isPasswordFocused ? kPrimaryColor : null,
                              ),
                              keyboardType: TextInputType.text,
                              focusNode: _passwordFocusNode,
                              cursorColor: kPrimaryColor,
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  labelText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: _isPasswordFocused
                                        ? kPrimaryColor
                                        : null,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                    child: Icon(
                                      !_showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: _isPasswordFocused
                                          ? kPrimaryColor
                                          : null,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Colors.black12,
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Lupa Password ?',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            LoginButton(
                              user: _usernameTextController.text,
                              pass: _passwordextController.text,
                            ),
                            const SizedBox(height: 8.0),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return state.isLoading
                                    ? Column(
                                        children: const [
                                          CircularProgressIndicator(),
                                          SizedBox(
                                            height: 8.0,
                                          )
                                        ],
                                      )
                                    : Container();
                              },
                            ),
                            const Text(
                              '* Apabila belum mempunyai password, silahkan hubungi pihak administrasi kampus.',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
