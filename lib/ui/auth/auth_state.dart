library auth_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  AuthLocal get auth;
  bool? get isLoading;
  String get error;
  String? get stateMessage;

  bool? get isDoneGetAuth;
  bool? get isDoneRenewToken;
  bool? get isSuccessLogout;
  bool? get isLoadingLogout;

  AuthState._();

  factory AuthState([Function(AuthStateBuilder b) updates]) = _$AuthState;

  factory AuthState.initial() {
    return AuthState((b) => b
      ..isLoading = false
      ..error = ''
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }

  factory AuthState.loading({
    String? stateMessage,
    bool? isLoading,
    bool? isLoadingLogout,
  }) {
    return AuthState((b) => b
      ..isLoading = isLoading
      ..error = ''
      ..stateMessage = stateMessage
      ..isLoadingLogout = isLoadingLogout
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }

  factory AuthState.success(AuthLocal auth,
      {String? stateMessage,
      bool? isDoneGetAuth,
      bool? isDoneRenewToken,
      bool? isSuccessLogout}) {
    return AuthState((b) => b
      ..isLoading = false
      ..isLoadingLogout = false
      ..error = ''
      ..stateMessage = stateMessage
      ..isDoneGetAuth = isDoneGetAuth
      ..isDoneRenewToken = isDoneRenewToken
      ..isSuccessLogout = isSuccessLogout
      ..auth.replace(auth));
  }

  factory AuthState.fail(String error,
      {String? stateMessage, bool? isSuccessLogout}) {
    return AuthState((b) => b
      ..isLoading = false
      ..isLoadingLogout = false
      ..stateMessage = stateMessage
      ..isSuccessLogout = isSuccessLogout
      ..error = ''
      ..auth.replace(AuthLocal((b) => b
        ..accessToken = ''
        ..refreshToken = ''
        ..id = 0
        ..createdAt = 0)));
  }
}
