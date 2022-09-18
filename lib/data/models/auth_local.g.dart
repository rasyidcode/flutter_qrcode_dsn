// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_local;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthLocal extends AuthLocal {
  @override
  final int? id;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final int? createdAt;

  factory _$AuthLocal([void Function(AuthLocalBuilder)? updates]) =>
      (new AuthLocalBuilder()..update(updates))._build();

  _$AuthLocal._({this.id, this.accessToken, this.refreshToken, this.createdAt})
      : super._();

  @override
  AuthLocal rebuild(void Function(AuthLocalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthLocalBuilder toBuilder() => new AuthLocalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthLocal &&
        id == other.id &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), accessToken.hashCode),
            refreshToken.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthLocal')
          ..add('id', id)
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class AuthLocalBuilder implements Builder<AuthLocal, AuthLocalBuilder> {
  _$AuthLocal? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  AuthLocalBuilder();

  AuthLocalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthLocal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthLocal;
  }

  @override
  void update(void Function(AuthLocalBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthLocal build() => _build();

  _$AuthLocal _build() {
    final _$result = _$v ??
        new _$AuthLocal._(
            id: id,
            accessToken: accessToken,
            refreshToken: refreshToken,
            createdAt: createdAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
