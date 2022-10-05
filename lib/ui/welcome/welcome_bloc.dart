import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/data/repositories/app_repository.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_event.dart';
import 'package:flutter_presensi_dsn/ui/welcome/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AppRepository _appRepository;

  void flagFirstTime() {
    add(FlagFirstTime());
  }

  WelcomeBloc(this._appRepository) : super(WelcomeState.initial()) {
    on<FlagFirstTime>((event, emit) async {
      emit(WelcomeState.loading());

      await Future.delayed(const Duration(seconds: 2));

      try {
        await _appRepository.flagFirstTime();
        emit(WelcomeState.success());
      } on Exception catch (_) {
        emit(WelcomeState.error('Something went wrong'));
      }
    });
  }
}
