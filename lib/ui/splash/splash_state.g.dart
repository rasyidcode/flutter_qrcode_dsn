// GENERATED CODE - DO NOT MODIFY BY HAND

part of splash_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashState extends SplashState {
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final bool? isFirstTime;

  factory _$SplashState([void Function(SplashStateBuilder)? updates]) =>
      (new SplashStateBuilder()..update(updates))._build();

  _$SplashState._(
      {required this.isLoading, required this.error, this.isFirstTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'SplashState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'SplashState', 'error');
  }

  @override
  SplashState rebuild(void Function(SplashStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashStateBuilder toBuilder() => new SplashStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashState &&
        isLoading == other.isLoading &&
        error == other.error &&
        isFirstTime == other.isFirstTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), error.hashCode), isFirstTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashState')
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('isFirstTime', isFirstTime))
        .toString();
  }
}

class SplashStateBuilder implements Builder<SplashState, SplashStateBuilder> {
  _$SplashState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isFirstTime;
  bool? get isFirstTime => _$this._isFirstTime;
  set isFirstTime(bool? isFirstTime) => _$this._isFirstTime = isFirstTime;

  SplashStateBuilder();

  SplashStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _error = $v.error;
      _isFirstTime = $v.isFirstTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashState;
  }

  @override
  void update(void Function(SplashStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashState build() => _build();

  _$SplashState _build() {
    final _$result = _$v ??
        new _$SplashState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'SplashState', 'isLoading'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'SplashState', 'error'),
            isFirstTime: isFirstTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
