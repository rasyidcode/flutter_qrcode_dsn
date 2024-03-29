// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthState extends AuthState {
  @override
  final AuthLocal auth;
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final bool isSuccess;
  @override
  final AuthStateSuccessType successType;
  @override
  final AuthStateErrorType errorType;

  factory _$AuthState([void Function(AuthStateBuilder)? updates]) =>
      (new AuthStateBuilder()..update(updates))._build();

  _$AuthState._(
      {required this.auth,
      required this.isLoading,
      required this.error,
      required this.isSuccess,
      required this.successType,
      required this.errorType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(auth, r'AuthState', 'auth');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'AuthState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'AuthState', 'error');
    BuiltValueNullFieldError.checkNotNull(isSuccess, r'AuthState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(
        successType, r'AuthState', 'successType');
    BuiltValueNullFieldError.checkNotNull(errorType, r'AuthState', 'errorType');
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        auth == other.auth &&
        isLoading == other.isLoading &&
        error == other.error &&
        isSuccess == other.isSuccess &&
        successType == other.successType &&
        errorType == other.errorType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, auth.hashCode), isLoading.hashCode),
                    error.hashCode),
                isSuccess.hashCode),
            successType.hashCode),
        errorType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthState')
          ..add('auth', auth)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('isSuccess', isSuccess)
          ..add('successType', successType)
          ..add('errorType', errorType))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState? _$v;

  AuthLocalBuilder? _auth;
  AuthLocalBuilder get auth => _$this._auth ??= new AuthLocalBuilder();
  set auth(AuthLocalBuilder? auth) => _$this._auth = auth;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  AuthStateSuccessType? _successType;
  AuthStateSuccessType? get successType => _$this._successType;
  set successType(AuthStateSuccessType? successType) =>
      _$this._successType = successType;

  AuthStateErrorType? _errorType;
  AuthStateErrorType? get errorType => _$this._errorType;
  set errorType(AuthStateErrorType? errorType) => _$this._errorType = errorType;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auth = $v.auth.toBuilder();
      _isLoading = $v.isLoading;
      _error = $v.error;
      _isSuccess = $v.isSuccess;
      _successType = $v.successType;
      _errorType = $v.errorType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthState build() => _build();

  _$AuthState _build() {
    _$AuthState _$result;
    try {
      _$result = _$v ??
          new _$AuthState._(
              auth: auth.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'AuthState', 'isLoading'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'AuthState', 'error'),
              isSuccess: BuiltValueNullFieldError.checkNotNull(
                  isSuccess, r'AuthState', 'isSuccess'),
              successType: BuiltValueNullFieldError.checkNotNull(
                  successType, r'AuthState', 'successType'),
              errorType: BuiltValueNullFieldError.checkNotNull(
                  errorType, r'AuthState', 'errorType'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'auth';
        auth.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
