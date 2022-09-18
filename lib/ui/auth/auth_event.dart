library auth_event;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';

part 'auth_event.g.dart';

abstract class AuthEvent {}

class GetAuth extends AuthEvent {}

abstract class RenewToken extends AuthEvent
    implements Built<RenewToken, RenewTokenBuilder> {
  AuthLocal get auth;
  RenewToken._();

  factory RenewToken([Function(RenewTokenBuilder b) updates]) = _$RenewToken;
}

abstract class Logout extends AuthEvent
    implements Built<Logout, LogoutBuilder> {
  String get accessToken;
  String get refreshToken;

  Logout._();

  factory Logout([Function(LogoutBuilder b) updates]) = _$Logout;
}
