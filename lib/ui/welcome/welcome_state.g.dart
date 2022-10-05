// GENERATED CODE - DO NOT MODIFY BY HAND

part of welcome_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WelcomeState extends WelcomeState {
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final bool isSuccess;

  factory _$WelcomeState([void Function(WelcomeStateBuilder)? updates]) =>
      (new WelcomeStateBuilder()..update(updates))._build();

  _$WelcomeState._(
      {required this.isLoading, required this.error, required this.isSuccess})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'WelcomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'WelcomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isSuccess, r'WelcomeState', 'isSuccess');
  }

  @override
  WelcomeState rebuild(void Function(WelcomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WelcomeStateBuilder toBuilder() => new WelcomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WelcomeState &&
        isLoading == other.isLoading &&
        error == other.error &&
        isSuccess == other.isSuccess;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), error.hashCode), isSuccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WelcomeState')
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('isSuccess', isSuccess))
        .toString();
  }
}

class WelcomeStateBuilder
    implements Builder<WelcomeState, WelcomeStateBuilder> {
  _$WelcomeState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  WelcomeStateBuilder();

  WelcomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _error = $v.error;
      _isSuccess = $v.isSuccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WelcomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WelcomeState;
  }

  @override
  void update(void Function(WelcomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WelcomeState build() => _build();

  _$WelcomeState _build() {
    final _$result = _$v ??
        new _$WelcomeState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'WelcomeState', 'isLoading'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'WelcomeState', 'error'),
            isSuccess: BuiltValueNullFieldError.checkNotNull(
                isSuccess, r'WelcomeState', 'isSuccess'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
