library splash_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool get isLoading;
  String get error;
  bool? get isFirstTime;
  String get stateMessage;
  bool get hideStateMessage;

  SplashState._();

  factory SplashState([Function(SplashStateBuilder b) updates]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..stateMessage = ''
      ..hideStateMessage = false);
  }

  factory SplashState.loading(String stateMessage) {
    return SplashState((b) => b
      ..isLoading = true
      ..stateMessage = stateMessage
      ..hideStateMessage = false
      ..error = '');
  }

  factory SplashState.fail(String errorMessage, {bool? isFirstTime}) {
    return SplashState((b) => b
      ..isLoading = false
      ..stateMessage = ''
      ..hideStateMessage = false
      ..error = errorMessage);
  }

  factory SplashState.success(String message, {bool? isFirstTime}) {
    return SplashState((b) => b
      ..isLoading = false
      ..stateMessage = message
      ..hideStateMessage = false
      ..error = '');
  }
}
