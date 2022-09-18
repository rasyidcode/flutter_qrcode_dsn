import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/data/execptions/api_access_error_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/provider_error_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/repository_error_exception.dart';
import 'package:flutter_presensi_dsn/data/models/auth_local.dart';
import 'package:flutter_presensi_dsn/data/repositories/auth_repository.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_event.dart';
import 'package:flutter_presensi_dsn/ui/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  void getAuth() {
    add(GetAuth());
  }

  void renewToken(AuthLocal auth) {
    add(RenewToken((b) => b..auth.replace(auth)));
  }

  void logout(AuthLocal auth) {
    add(Logout((b) => b
      ..accessToken = auth.accessToken
      ..refreshToken = auth.refreshToken));
  }

  AuthBloc(this._authRepository) : super(AuthState.initial()) {
    on<GetAuth>((event, emit) async {
      emit(AuthState.loading(stateMessage: 'Getting auth...', isLoading: true));

      try {
        final auth = await _authRepository.getAuth();
        emit(AuthState.success(auth,
            stateMessage: 'Auth exist', isDoneGetAuth: true));
      } on ProviderErrorException catch (e) {
        emit(AuthState.fail(e.message));
      } on Exception catch (_) {
        emit(AuthState.fail('Something went wrong'));
      }
    });
    on<RenewToken>((event, emit) async {
      emit(AuthState.loading(isLoading: true));

      try {
        final auth = await _authRepository.renewToken(event.auth);
        emit(AuthState.success(auth, isDoneRenewToken: true));
      } on ApiAccessErrorException catch (e) {
        emit(AuthState.fail(e.message));
      } on RepositoryErrorException catch (e) {
        emit(AuthState.fail(e.message));
      } on Exception catch (_) {
        emit(AuthState.fail('Something went wrong'));
      }
    });
    on<Logout>((event, emit) async {
      emit(AuthState.loading(isLoading: true, isLoadingLogout: true));

      try {
        await _authRepository.logout(event.accessToken, event.refreshToken);
        emit(AuthState.success(state.auth, isSuccessLogout: true));
      } on ApiAccessErrorException catch (e) {
        emit(AuthState.fail(e.message, isSuccessLogout: false));
      } on RepositoryErrorException catch (e) {
        emit(AuthState.fail(e.message, isSuccessLogout: false));
      } on Exception catch (_) {
        emit(AuthState.fail('Something went wrong', isSuccessLogout: false));
      }
    });
  }
}
