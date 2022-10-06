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

  void postQR(String accessToken, int idJadwal, String qrCode) {
    add(PostQR((b) => b
      ..accessToken = accessToken
      ..idJadwal = idJadwal
      ..qrCode = qrCode));
  }

  HomeBloc(this._perkuliahanRepository) : super(HomeState.initial()) {
    on<GetListMatkul>((event, emit) async {
      emit(HomeState.loading(type: HomeStateLoadingType.getList));

      await Future.delayed(const Duration(seconds: 2));

      try {
        final result =
            await _perkuliahanRepository.getPerkuliahanList(event.accessToken);
        emit(HomeState.success(
          result,
          type: HomeStateSuccessType.getList,
        ));
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.apiError,
        ));
      } on ApiExpiredTokenExecption catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.expiredToken,
        ));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.listEmpty,
        ));
      } on Exception catch (_) {
        emit(HomeState.error('Something went wrong',
            type: HomeStateErrorType.unknownError));
      }
    });
    on<PostQR>((event, emit) async {
      emit(HomeState.loading(type: HomeStateLoadingType.postQr));

      try {
        await _perkuliahanRepository.postQR(
            event.accessToken, event.idJadwal, event.qrCode);
        emit(HomeState.success(
          state.data,
          type: HomeStateSuccessType.postQr,
        ));
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.apiError,
        ));
      } on ApiExpiredTokenExecption catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.expiredToken,
        ));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.responseFormatError,
        ));
      } on Exception catch (_) {
        emit(HomeState.error(
          'Something went wrong',
          type: HomeStateErrorType.unknownError,
        ));
      }
    });
    on<SubmitPerkuliahan>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
