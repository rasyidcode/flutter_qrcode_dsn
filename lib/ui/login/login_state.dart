library login_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  String get error;
  bool get isSuccess;
  AuthLocal get auth;
  bool get isLoading;

  LoginState._();

  factory LoginState([Function(LoginStateBuilder b) updates]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState((b) => b
      ..error = ''
      ..isSuccess = false
      ..isLoading = false);
  }

  factory LoginState.loading() {
    return LoginState((b) => b
      ..error = ''
      ..isSuccess = false
      ..isLoading = true);
  }

  factory LoginState.error(String err) {
    return LoginState((b) => b
      ..error = err
      ..isSuccess = false
      ..isLoading = false);
  }

  factory LoginState.success() {
    return LoginState((b) => b
      ..error = ''
      ..isSuccess = true
      ..isLoading = false);
  }
}
