import 'package:flutter_presensi_dsn/data/db/presensi_app_db.dart';
import 'package:flutter_presensi_dsn/data/execptions/provider_error_exception.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';
import 'package:flutter_presensi_dsn/data/providers/base_provider.dart';
import 'package:built_collection/built_collection.dart';

class AuthProvider extends BaseProvider {
  final PresensiAppDb _presensiAppDb;
  AuthProvider(this._presensiAppDb);

  Future<void> updateToken(AuthLocal auth) async {
    await (await _presensiAppDb.db)?.update('auth', auth.toMap());
  }

  Future<void> removeAuth() async {
    await (await _presensiAppDb.db)?.rawDelete('DELETE FROM auth');
  }

  Future<void> saveAuth(AuthLocal auth) async {
    await (await _presensiAppDb.db)?.insert('auth', auth.toMap());
  }

  Future<AuthLocal> getAuth() async {
    final auth = await (await _presensiAppDb.db)
        ?.rawQuery('SELECT * FROM auth ORDER BY id DESC LIMIT 1');

    if (auth == null) {
      throw ProviderErrorException('Auth not found');
    }

    if (auth.isEmpty) {
      throw ProviderErrorException('Auth is empty');
    }

    final authLocal = auth
        .map((a) => AuthLocal((b) => b
          ..id = a['id'] as int
          ..accessToken = a['accessToken'] as String
          ..refreshToken = a['refreshToken'] as String
          ..createdAt = a['createdAt'] as int))
        .toBuiltList();
    return authLocal[0];
  }
}
