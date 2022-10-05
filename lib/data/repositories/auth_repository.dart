import 'dart:developer';

import 'package:flutter_presensi_dsn/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_dsn/data/execptions/repository_error_exception.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';
import 'package:flutter_presensi_dsn/data/providers/auth_provider.dart';
import 'package:flutter_presensi_dsn/data/providers/base_provider.dart';

class AuthRepository {
  final PresensiAppBackendApi _presensiAppApi;
  final BaseProvider _baseProvider;

  AuthRepository(this._presensiAppApi, this._baseProvider);

  Future<void> login(String username, String password) async {
    final result =
        await _presensiAppApi.login(username: username, password: password);

    if (result == null) {
      throw RepositoryErrorException('Login api returns null');
    }

    await (_baseProvider as AuthProvider).saveAuth(AuthLocal((b) => b
      ..id = null
      ..accessToken = result.accessToken
      ..refreshToken = result.refreshToken
      ..createdAt = DateTime.now().millisecondsSinceEpoch ~/ 1000));
  }

  Future<String?> logout(String accessToken, String refreshToken) async {
    final result = await _presensiAppApi.logout(
        accessToken: accessToken, refreshToken: refreshToken);

    if (result == null) {
      throw RepositoryErrorException('Logout result returns null');
    }

    await (_baseProvider as AuthProvider).removeAuth();

    return result;
  }

  Future<AuthLocal> renewToken(AuthLocal auth) async {
    String? refreshToken = auth.refreshToken;
    if (refreshToken == null) {
      throw RepositoryErrorException('Refresh token is null');
    }

    String? accessToken =
        await _presensiAppApi.renewAccessToken(refreshToken: refreshToken);

    if (accessToken == null) {
      throw RepositoryErrorException('Access token is null');
    }

    var updatedAuth = auth.rebuild((p0) => p0..accessToken = accessToken);
    await (_baseProvider as AuthProvider).updateToken(auth);

    return updatedAuth;
  }

  Future<AuthLocal> getAuth() async {
    return await (_baseProvider as AuthProvider).getAuth();
  }
}
