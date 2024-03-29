// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final String error;
  @override
  final String message;
  @override
  final PerkuliahanList data;
  @override
  final bool isLoading;
  @override
  final HomeStateErrorType errorType;
  @override
  final HomeStateSuccessType successType;
  @override
  final HomeStateLoadingType loadingType;
  @override
  final int currentIdJadwal;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates))._build();

  _$HomeState._(
      {required this.error,
      required this.message,
      required this.data,
      required this.isLoading,
      required this.errorType,
      required this.successType,
      required this.loadingType,
      required this.currentIdJadwal})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, r'HomeState', 'message');
    BuiltValueNullFieldError.checkNotNull(data, r'HomeState', 'data');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(errorType, r'HomeState', 'errorType');
    BuiltValueNullFieldError.checkNotNull(
        successType, r'HomeState', 'successType');
    BuiltValueNullFieldError.checkNotNull(
        loadingType, r'HomeState', 'loadingType');
    BuiltValueNullFieldError.checkNotNull(
        currentIdJadwal, r'HomeState', 'currentIdJadwal');
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
        message == other.message &&
        data == other.data &&
        isLoading == other.isLoading &&
        errorType == other.errorType &&
        successType == other.successType &&
        loadingType == other.loadingType &&
        currentIdJadwal == other.currentIdJadwal;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, error.hashCode), message.hashCode),
                            data.hashCode),
                        isLoading.hashCode),
                    errorType.hashCode),
                successType.hashCode),
            loadingType.hashCode),
        currentIdJadwal.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeState')
          ..add('error', error)
          ..add('message', message)
          ..add('data', data)
          ..add('isLoading', isLoading)
          ..add('errorType', errorType)
          ..add('successType', successType)
          ..add('loadingType', loadingType)
          ..add('currentIdJadwal', currentIdJadwal))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PerkuliahanListBuilder? _data;
  PerkuliahanListBuilder get data =>
      _$this._data ??= new PerkuliahanListBuilder();
  set data(PerkuliahanListBuilder? data) => _$this._data = data;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  HomeStateErrorType? _errorType;
  HomeStateErrorType? get errorType => _$this._errorType;
  set errorType(HomeStateErrorType? errorType) => _$this._errorType = errorType;

  HomeStateSuccessType? _successType;
  HomeStateSuccessType? get successType => _$this._successType;
  set successType(HomeStateSuccessType? successType) =>
      _$this._successType = successType;

  HomeStateLoadingType? _loadingType;
  HomeStateLoadingType? get loadingType => _$this._loadingType;
  set loadingType(HomeStateLoadingType? loadingType) =>
      _$this._loadingType = loadingType;

  int? _currentIdJadwal;
  int? get currentIdJadwal => _$this._currentIdJadwal;
  set currentIdJadwal(int? currentIdJadwal) =>
      _$this._currentIdJadwal = currentIdJadwal;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _data = $v.data.toBuilder();
      _isLoading = $v.isLoading;
      _errorType = $v.errorType;
      _successType = $v.successType;
      _loadingType = $v.loadingType;
      _currentIdJadwal = $v.currentIdJadwal;
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
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'HomeState', 'message'),
              data: data.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'HomeState', 'isLoading'),
              errorType: BuiltValueNullFieldError.checkNotNull(
                  errorType, r'HomeState', 'errorType'),
              successType: BuiltValueNullFieldError.checkNotNull(
                  successType, r'HomeState', 'successType'),
              loadingType: BuiltValueNullFieldError.checkNotNull(
                  loadingType, r'HomeState', 'loadingType'),
              currentIdJadwal: BuiltValueNullFieldError.checkNotNull(
                  currentIdJadwal, r'HomeState', 'currentIdJadwal'));
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
