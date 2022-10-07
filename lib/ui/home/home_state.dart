library home_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_item.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_list.dart';

part 'home_state.g.dart';

enum HomeStateErrorType {
  initial,
  apiError,
  expiredToken,
  listEmpty,
  responseFormatError,
  unknownError
}

enum HomeStateSuccessType { initial, getList, postQr, logout }

enum HomeStateLoadingType { initial, getList, postQr, logout }

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  String get error;
  String get message;
  PerkuliahanList get data;
  bool get isLoading;
  bool get isSuccess => data.data.isNotEmpty;
  HomeStateErrorType get errorType;
  HomeStateSuccessType get successType;
  HomeStateLoadingType get loadingType;

  HomeState._();

  factory HomeState([Function(HomeStateBuilder b) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..error = ''
      ..message = ''
      ..errorType = HomeStateErrorType.initial
      ..loadingType = HomeStateLoadingType.initial
      ..successType = HomeStateSuccessType.initial
      ..data.replace(PerkuliahanList((b) => b
        ..data.replace(BuiltList<PerkuliahanItem>())
        ..total = 0))
      ..isLoading = false);
  }

  factory HomeState.loading({
    HomeStateLoadingType type = HomeStateLoadingType.initial,
    required PerkuliahanList list,
  }) {
    return HomeState((b) => b
      ..error = ''
      ..message = ''
      ..errorType = HomeStateErrorType.initial
      ..loadingType = type
      ..successType = HomeStateSuccessType.initial
      ..data.replace(list)
      ..isLoading = true);
  }

  factory HomeState.error(
    String err, {
    HomeStateErrorType type = HomeStateErrorType.initial,
    required PerkuliahanList list,
  }) {
    return HomeState((b) => b
      ..error = err
      ..message = ''
      ..errorType = type
      ..loadingType = HomeStateLoadingType.initial
      ..successType = HomeStateSuccessType.initial
      ..data.replace(list)
      ..isLoading = false);
  }

  factory HomeState.success(
    PerkuliahanList list, {
    HomeStateSuccessType type = HomeStateSuccessType.initial,
    String message = '',
  }) {
    return HomeState((b) => b
      ..error = ''
      ..message = message
      ..errorType = HomeStateErrorType.initial
      ..loadingType = HomeStateLoadingType.initial
      ..successType = type
      ..data.replace(list)
      ..isLoading = false);
  }
}
