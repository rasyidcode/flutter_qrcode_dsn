library auth_local;

import 'package:built_value/built_value.dart';

part 'auth_local.g.dart';

abstract class AuthLocal implements Built<AuthLocal, AuthLocalBuilder> {
  int? get id;
  String? get accessToken;
  String? get refreshToken;
  int? get createdAt;

  AuthLocal._();

  factory AuthLocal([Function(AuthLocalBuilder b) updates]) = _$AuthLocal;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'id': id,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'createdAt': createdAt
    };
  }
}
