import 'package:flutter_presensi_dsn/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_dsn/data/db/presensi_app_db.dart';
import 'package:flutter_presensi_dsn/data/providers/app_provider.dart';
import 'package:flutter_presensi_dsn/data/providers/auth_provider.dart';
import 'package:flutter_presensi_dsn/data/repositories/app_repository.dart';
import 'package:flutter_presensi_dsn/data/repositories/auth_repository.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_dsn/ui/splash/splash_bloc.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

Future initKiwi() async {
  String dbPath = await getDatabasesPath();

  KiwiContainer()
    ..registerInstance(http.Client())
    ..registerFactory((container) => PresensiAppDb(dbPath))
    ..registerFactory((container) => PresensiAppBackendApi(container.resolve()))
    // provider
    ..registerFactory((container) => AppProvider(container.resolve()))
    ..registerFactory((container) => AuthProvider(container.resolve()))
    // repository
    ..registerFactory(
        (container) => AppRepository(container.resolve<AppProvider>()))
    ..registerFactory((container) =>
        AuthRepository(container.resolve(), container.resolve<AuthProvider>()))
    // bloc
    ..registerFactory((container) => AuthBloc(container.resolve()))
    ..registerFactory((container) => SplashBloc(container.resolve()))
    ..registerFactory((container) => WelcomeBloc(container.resolve()));
}
