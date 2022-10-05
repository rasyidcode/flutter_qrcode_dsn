library welcome_state;

import 'package:built_value/built_value.dart';

part 'welcome_state.g.dart';

abstract class WelcomeState
    implements Built<WelcomeState, WelcomeStateBuilder> {
  bool get isLoading;
  String get error;
  bool get isSuccess;

  WelcomeState._();

  factory WelcomeState([Function(WelcomeStateBuilder b) updates]) =
      _$WelcomeState;

  factory WelcomeState.initial() {
    return WelcomeState((b) => b
      ..isLoading = false
      ..error = ''
      ..isSuccess = false);
  }

  factory WelcomeState.loading() {
    return WelcomeState((b) => b
      ..isLoading = true
      ..error = ''
      ..isSuccess = false);
  }

  factory WelcomeState.error(String err) {
    return WelcomeState((b) => b
      ..isLoading = false
      ..error = err
      ..isSuccess = false);
  }

  factory WelcomeState.success() {
    return WelcomeState((b) => b
      ..isLoading = false
      ..error = ''
      ..isSuccess = true);
  }
}
