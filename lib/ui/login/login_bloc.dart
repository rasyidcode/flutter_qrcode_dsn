import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/data/execptions/api_access_error_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/repository_error_exception.dart';
import 'package:flutter_presensi_dsn/data/repositories/auth_repository.dart';
import 'package:flutter_presensi_dsn/ui/login/login_event.dart';
import 'package:flutter_presensi_dsn/ui/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  void doLogin(String user, String pass) {
    add(DoLogin((b) => b
      ..username = user
      ..password = pass));
  }

  LoginBloc(this._authRepository) : super(LoginState.initial()) {
    on<DoLogin>((event, emit) async {
      emit(LoginState.loading());

      await Future.delayed(const Duration(seconds: 2));

      try {
        await _authRepository.login(event.username, event.password);
        emit(LoginState.success());
      } on ApiAccessErrorException catch (e) {
        emit(LoginState.error(e.message));
      } on RepositoryErrorException catch (e) {
        emit(LoginState.error(e.message));
      } on Exception catch (_) {
        emit(LoginState.error('Something went wrong'));
      }
    });
  }
}
