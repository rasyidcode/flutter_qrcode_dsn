library home_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_item.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_list.dart';

part 'home_state.g.dart';

enum HomeStateErrorType { initial, common, expiredToken, empty }

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  String get error;
  PerkuliahanList get data;
  bool get isLoading;
  bool get isSuccess;
  HomeStateErrorType get errorType;

  HomeState._();

  factory HomeState([Function(HomeStateBuilder b) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..error = ''
      ..errorType = HomeStateErrorType.initial
      ..data.replace(PerkuliahanList((b) => b
        ..data.replace(BuiltList<PerkuliahanItem>())
        ..total = 0))
      ..isLoading = false
      ..isSuccess = false);
  }

  factory HomeState.loading() {
    return HomeState((b) => b
      ..error = ''
      ..errorType = HomeStateErrorType.initial
      ..data.replace(PerkuliahanList((b) => b
        ..data.replace(BuiltList<PerkuliahanItem>())
        ..total = 0))
      ..isLoading = true
      ..isSuccess = false);
  }

  factory HomeState.error(String err,
      {HomeStateErrorType type = HomeStateErrorType.common}) {
    return HomeState((b) => b
      ..error = err
      ..errorType = type
      ..data.replace(PerkuliahanList((b) => b
        ..data.replace(BuiltList<PerkuliahanItem>())
        ..total = 0))
      ..isLoading = false
      ..isSuccess = false);
  }

  factory HomeState.success(PerkuliahanList list) {
    return HomeState((b) => b
      ..error = ''
      ..data.replace(list)
      ..isLoading = false
      ..isSuccess = true);
  }
}
