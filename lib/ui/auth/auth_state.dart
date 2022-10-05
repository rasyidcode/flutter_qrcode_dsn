library auth_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';

part 'auth_state.g.dart';

enum SuccessState { initial, authNotFound, authFound }

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  AuthLocal get auth;
  bool get isLoading;
  String get error;
  SuccessState get isSuccess;

  bool get isHasAuth =>
      auth.accessToken!.isNotEmpty &&
      auth.id != 0 &&
      auth.refreshToken!.isNotEmpty &&
      auth.createdAt != 0;

  AuthState._();

  factory AuthState([Function(AuthStateBuilder b) updates]) = _$AuthState;

  factory AuthState.initial() {
    return AuthState((b) => b
      ..isLoading = false
      ..error = ''
      ..isSuccess = SuccessState.initial
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }

  factory AuthState.loading() {
    return AuthState((b) => b
      ..isLoading = true
      ..error = ''
      ..isSuccess = SuccessState.initial
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }

  factory AuthState.success(AuthLocal auth) {
    return AuthState((b) => b
      ..isLoading = false
      ..error = ''
      ..isSuccess = SuccessState.authFound
      ..auth.replace(auth));
  }

  factory AuthState.fail(String error) {
    return AuthState((b) => b
      ..isLoading = false
      ..error = ''
      ..isSuccess = SuccessState.authNotFound
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }
}
