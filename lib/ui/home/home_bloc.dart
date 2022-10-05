import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/data/execptions/api_access_error_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/api_expired_token_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/repository_error_exception.dart';
import 'package:flutter_presensi_dsn/data/repositories/perkuliahan_repository.dart';
import 'package:flutter_presensi_dsn/ui/home/home_event.dart';
import 'package:flutter_presensi_dsn/ui/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PerkuliahanRepository _perkuliahanRepository;

  void getListMatkul(String accessToken) {
    add(GetListMatkul((b) => b..accessToken = accessToken));
  }

  HomeBloc(this._perkuliahanRepository) : super(HomeState.initial()) {
    on<GetListMatkul>((event, emit) async {
      emit(HomeState.loading());

      await Future.delayed(const Duration(seconds: 2));

      try {
        final result =
            await _perkuliahanRepository.getPerkuliahanList(event.accessToken);
        log('$runtimeType : success => $result');
        emit(HomeState.success(result));
      } on ApiAccessErrorException catch (e) {
        log('$runtimeType : ApiAccessErrorException => ${e.message}');
        emit(HomeState.error(e.message));
      } on ApiExpiredTokenExecption catch (e) {
        log('$runtimeType : ApiExpiredTokenExecption => ${e.message}');
        emit(HomeState.error(e.message, type: HomeStateErrorType.expiredToken));
      } on RepositoryErrorException catch (e) {
        log('$runtimeType : RepositoryErrorException => ${e.message}');
        emit(HomeState.error(e.message, type: HomeStateErrorType.empty));
      } on Exception catch (_) {
        log('$runtimeType : something went wrong');
        emit(HomeState.error('Something went wrong'));
      }
    });
    on<PostQR>((event, emit) async {
      // TODO: implement event handler
    });
    on<SubmitPerkuliahan>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
