import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_dsn/data/execptions/api_access_error_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/api_expired_token_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/repository_error_exception.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_item.dart';
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

  void submitPerkuliahan(String accessToken, int idJadwal) {
    add(SubmitPerkuliahan((b) => b
      ..idJadwal = idJadwal
      ..accessToken = accessToken));
  }

  HomeBloc(this._perkuliahanRepository) : super(HomeState.initial()) {
    on<GetListMatkul>((event, emit) async {
      emit(HomeState.loading(
        type: HomeStateLoadingType.getList,
        list: state.data,
      ));

      await Future.delayed(const Duration(seconds: 2));

      try {
        final result =
            await _perkuliahanRepository.getPerkuliahanList(event.accessToken);
        emit(HomeState.success(
          result,
          type: HomeStateSuccessType.getList,
        ));
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(e.message,
            type: HomeStateErrorType.apiError, list: state.data));
      } on ApiExpiredTokenExecption catch (e) {
        emit(HomeState.error(e.message,
            type: HomeStateErrorType.expiredToken, list: state.data));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(e.message,
            type: HomeStateErrorType.listEmpty, list: state.data));
      } on Exception catch (_) {
        emit(HomeState.error(
          'Something went wrong',
          type: HomeStateErrorType.unknownError,
          list: state.data,
        ));
      }
    });
    on<PostQR>((event, emit) async {
      emit(HomeState.loading(
        type: HomeStateLoadingType.postQr,
        list: state.data,
        currentIdJadwal: event.idJadwal,
      ));

      await Future.delayed(const Duration(seconds: 2));

      try {
        final message = await _perkuliahanRepository.postQR(
          event.accessToken,
          event.idJadwal,
          event.qrCode,
        );

        PerkuliahanItem item = await _perkuliahanRepository.getDetail(
            event.accessToken, event.idJadwal);

        var newList = state.data.data.toList();
        newList[newList.indexWhere((p0) => p0.idJadwal == item.idJadwal)] =
            item;
        state.data.rebuild((b) => b..data.replace(newList.toBuiltList()));

        emit(HomeState.success(state.data,
            type: HomeStateSuccessType.postQr, message: message));
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.apiError,
          list: state.data,
        ));
      } on ApiExpiredTokenExecption catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.expiredToken,
          list: state.data,
        ));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.responseFormatError,
          list: state.data,
        ));
      } on Exception catch (_) {
        emit(HomeState.error(
          'Something went wrong',
          type: HomeStateErrorType.unknownError,
          list: state.data,
        ));
      }
    });
    on<SubmitPerkuliahan>((event, emit) async {
      emit(HomeState.loading(
        type: HomeStateLoadingType.submitPerkuliahan,
        list: state.data,
        currentIdJadwal: event.idJadwal,
      ));

      await Future.delayed(const Duration(seconds: 2));

      try {
        final message = await _perkuliahanRepository.submitPerkuliahan(
            event.accessToken, event.idJadwal);

        PerkuliahanItem item = await _perkuliahanRepository.getDetail(
            event.accessToken, event.idJadwal);

        var newList = state.data.data.toList();
        newList[newList.indexWhere((p0) => p0.idJadwal == item.idJadwal)] =
            item;
        state.data.rebuild((b) => b..data.replace(newList.toBuiltList()));

        emit(HomeState.success(
          state.data,
          type: HomeStateSuccessType.submitPerkuliahan,
          message: message,
        ));
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.apiError,
          list: state.data,
        ));
      } on ApiExpiredTokenExecption catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.expiredToken,
          list: state.data,
        ));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(
          e.message,
          type: HomeStateErrorType.responseFormatError,
          list: state.data,
        ));
      } on Exception catch (_) {
        emit(HomeState.error(
          'Something went wrong',
          type: HomeStateErrorType.unknownError,
          list: state.data,
        ));
      }
    });
  }
}
