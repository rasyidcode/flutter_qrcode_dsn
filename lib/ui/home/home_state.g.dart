// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final String error;
  @override
  final PerkuliahanList data;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final HomeStateErrorType errorType;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates))._build();

  _$HomeState._(
      {required this.error,
      required this.data,
      required this.isLoading,
      required this.isSuccess,
      required this.errorType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(data, r'HomeState', 'data');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(isSuccess, r'HomeState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(errorType, r'HomeState', 'errorType');
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        error == other.error &&
        data == other.data &&
        isLoading == other.isLoading &&
        isSuccess == other.isSuccess &&
        errorType == other.errorType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, error.hashCode), data.hashCode), isLoading.hashCode),
            isSuccess.hashCode),
        errorType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeState')
          ..add('error', error)
          ..add('data', data)
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('errorType', errorType))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  PerkuliahanListBuilder? _data;
  PerkuliahanListBuilder get data =>
      _$this._data ??= new PerkuliahanListBuilder();
  set data(PerkuliahanListBuilder? data) => _$this._data = data;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  HomeStateErrorType? _errorType;
  HomeStateErrorType? get errorType => _$this._errorType;
  set errorType(HomeStateErrorType? errorType) => _$this._errorType = errorType;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _data = $v.data.toBuilder();
      _isLoading = $v.isLoading;
      _isSuccess = $v.isSuccess;
      _errorType = $v.errorType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeState build() => _build();

  _$HomeState _build() {
    _$HomeState _$result;
    try {
      _$result = _$v ??
          new _$HomeState._(
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'HomeState', 'error'),
              data: data.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'HomeState', 'isLoading'),
              isSuccess: BuiltValueNullFieldError.checkNotNull(
                  isSuccess, r'HomeState', 'isSuccess'),
              errorType: BuiltValueNullFieldError.checkNotNull(
                  errorType, r'HomeState', 'errorType'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'HomeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
