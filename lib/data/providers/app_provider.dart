import 'package:flutter_presensi_dsn/data/db/presensi_app_db.dart';
import 'package:flutter_presensi_dsn/data/execptions/provider_error_exception.dart';
import 'package:flutter_presensi_dsn/data/providers/base_provider.dart';

class AppProvider extends BaseProvider {
  final PresensiAppDb _presensiAppDb;

  AppProvider(this._presensiAppDb);

  Future<bool> checkFirstTime() async {
    final data = await (await _presensiAppDb.db)
        ?.rawQuery('SELECT COUNT(*) as total FROM firstTime');
    if (data == null) {
      throw ProviderErrorException('Query returns null');
    }

    if (data.isEmpty) {
      throw ProviderErrorException('Query returns empty');
    }

    var totalData = data.first['total'];
    if (totalData == null) {
      throw ProviderErrorException('Query is error');
    }

    int total = totalData as int;
    return total <= 0;
  }

  Future<void> flagFirstTime() async {
    await (await _presensiAppDb.db)?.insert('firstTime', {
      'firstTime': 1,
      'createdAt': DateTime.now().millisecondsSinceEpoch ~/ 1000
    });
  }
}
