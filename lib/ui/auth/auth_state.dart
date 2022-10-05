library auth_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';

part 'auth_state.g.dart';

enum AuthStateSuccessType { initial, authFound, tokenRenewed, logoutSucceed }

enum AuthStateErrorType {
  initial,
  authNotFound,
  failedRenewToken,
  unknown,
  logoutFailed
}

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  AuthLocal get auth;
  bool get isLoading;
  String get error;
  bool get isSuccess;
  AuthStateSuccessType get successType;
  AuthStateErrorType get errorType;

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
      ..isSuccess = false
      ..successType = AuthStateSuccessType.initial
      ..errorType = AuthStateErrorType.initial
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
      ..isSuccess = false
      ..successType = AuthStateSuccessType.initial
      ..errorType = AuthStateErrorType.initial
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }

  factory AuthState.success(AuthLocal auth,
      {required AuthStateSuccessType type}) {
    return AuthState((b) => b
      ..isLoading = false
      ..error = ''
      ..successType = type
      ..errorType = AuthStateErrorType.initial
      ..isSuccess = true
      ..auth.replace(auth));
  }

  factory AuthState.error(String err, {required AuthStateErrorType type}) {
    return AuthState((b) => b
      ..isLoading = false
      ..error = err
      ..isSuccess = false
      ..successType = AuthStateSuccessType.initial
      ..errorType = type
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }
}
