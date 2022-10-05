library splash_state;

import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool get isLoading;
  String get error;
  bool? get isFirstTime;

  SplashState._();

  factory SplashState([Function(SplashStateBuilder b) updates]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState((b) => b
      ..isLoading = false
      ..error = '');
  }

  factory SplashState.loading() {
    return SplashState((b) => b
      ..isLoading = true
      ..error = '');
  }

  factory SplashState.fail(String errorMessage) {
    return SplashState((b) => b
      ..isLoading = false
      ..error = errorMessage);
  }

  factory SplashState.firstTime() {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..isFirstTime = true);
  }

  factory SplashState.notFirstTime() {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..isFirstTime = false);
  }
}
