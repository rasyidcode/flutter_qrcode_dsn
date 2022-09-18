import 'package:flutter_presensi_dsn/data/providers/app_provider.dart';
import 'package:flutter_presensi_dsn/data/providers/base_provider.dart';

class AppRepository {
  final BaseProvider _baseProvider;

  AppRepository(this._baseProvider);

  Future<bool> checkFirstTime() async {
    return await (_baseProvider as AppProvider).checkFirstTime();
  }

  Future<void> flagFirstTime() async {
    await (_baseProvider as AppProvider).flagFirstTime();
  }
}
