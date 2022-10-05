// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginState extends LoginState {
  @override
  final String error;
  @override
  final bool isSuccess;
  @override
  final AuthLocal auth;
  @override
  final bool isLoading;

  factory _$LoginState([void Function(LoginStateBuilder)? updates]) =>
      (new LoginStateBuilder()..update(updates))._build();

  _$LoginState._(
      {required this.error,
      required this.isSuccess,
      required this.auth,
      required this.isLoading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'LoginState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isSuccess, r'LoginState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(auth, r'LoginState', 'auth');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'LoginState', 'isLoading');
  }

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        error == other.error &&
        isSuccess == other.isSuccess &&
        auth == other.auth &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, error.hashCode), isSuccess.hashCode), auth.hashCode),
        isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginState')
          ..add('error', error)
          ..add('isSuccess', isSuccess)
          ..add('auth', auth)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  AuthLocalBuilder? _auth;
  AuthLocalBuilder get auth => _$this._auth ??= new AuthLocalBuilder();
  set auth(AuthLocalBuilder? auth) => _$this._auth = auth;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isSuccess = $v.isSuccess;
      _auth = $v.auth.toBuilder();
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginState build() => _build();

  _$LoginState _build() {
    _$LoginState _$result;
    try {
      _$result = _$v ??
          new _$LoginState._(
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'LoginState', 'error'),
              isSuccess: BuiltValueNullFieldError.checkNotNull(
                  isSuccess, r'LoginState', 'isSuccess'),
              auth: auth.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'LoginState', 'isLoading'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'auth';
        auth.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LoginState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
