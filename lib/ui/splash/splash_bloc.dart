import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/data/execptions/provider_error_exception.dart';
import 'package:flutter_presensi_dsn/data/repositories/app_repository.dart';
import 'package:flutter_presensi_dsn/ui/splash/splash_event.dart';
import 'package:flutter_presensi_dsn/ui/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRepository _appRepository;

  SplashBloc(this._appRepository) : super(SplashState.initial()) {
    on<CheckFirstTime>((event, emit) async {
      emit(SplashState.loading());

      await Future.delayed(const Duration(seconds: 2));

      try {
        bool isFirstTime = await _appRepository.checkFirstTime();
        if (isFirstTime) {
          emit(SplashState.firstTime());
        } else {
          emit(SplashState.notFirstTime());
        }
      } on ProviderErrorException catch (_) {
        emit(SplashState.firstTime());
      } on Exception catch (_) {
        emit(SplashState.fail('Something went wrong'));
      }
    });
  }

  void checkFirstTime() {
    add(CheckFirstTime());
  }
}
