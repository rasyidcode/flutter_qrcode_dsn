// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetListMatkul extends GetListMatkul {
  @override
  final String accessToken;

  factory _$GetListMatkul([void Function(GetListMatkulBuilder)? updates]) =>
      (new GetListMatkulBuilder()..update(updates))._build();

  _$GetListMatkul._({required this.accessToken}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, r'GetListMatkul', 'accessToken');
  }

  @override
  GetListMatkul rebuild(void Function(GetListMatkulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetListMatkulBuilder toBuilder() => new GetListMatkulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetListMatkul && accessToken == other.accessToken;
  }

  @override
  int get hashCode {
    return $jf($jc(0, accessToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetListMatkul')
          ..add('accessToken', accessToken))
        .toString();
  }
}

class GetListMatkulBuilder
    implements Builder<GetListMatkul, GetListMatkulBuilder> {
  _$GetListMatkul? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  GetListMatkulBuilder();

  GetListMatkulBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetListMatkul other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetListMatkul;
  }

  @override
  void update(void Function(GetListMatkulBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetListMatkul build() => _build();

  _$GetListMatkul _build() {
    final _$result = _$v ??
        new _$GetListMatkul._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, r'GetListMatkul', 'accessToken'));
    replace(_$result);
    return _$result;
  }
}

class _$PostQR extends PostQR {
  @override
  final String accessToken;
  @override
  final int idJadwal;
  @override
  final String qrCode;

  factory _$PostQR([void Function(PostQRBuilder)? updates]) =>
      (new PostQRBuilder()..update(updates))._build();

  _$PostQR._(
      {required this.accessToken, required this.idJadwal, required this.qrCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, r'PostQR', 'accessToken');
    BuiltValueNullFieldError.checkNotNull(idJadwal, r'PostQR', 'idJadwal');
    BuiltValueNullFieldError.checkNotNull(qrCode, r'PostQR', 'qrCode');
  }

  @override
  PostQR rebuild(void Function(PostQRBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostQRBuilder toBuilder() => new PostQRBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostQR &&
        accessToken == other.accessToken &&
        idJadwal == other.idJadwal &&
        qrCode == other.qrCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, accessToken.hashCode), idJadwal.hashCode), qrCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostQR')
          ..add('accessToken', accessToken)
          ..add('idJadwal', idJadwal)
          ..add('qrCode', qrCode))
        .toString();
  }
}

class PostQRBuilder implements Builder<PostQR, PostQRBuilder> {
  _$PostQR? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  int? _idJadwal;
  int? get idJadwal => _$this._idJadwal;
  set idJadwal(int? idJadwal) => _$this._idJadwal = idJadwal;

  String? _qrCode;
  String? get qrCode => _$this._qrCode;
  set qrCode(String? qrCode) => _$this._qrCode = qrCode;

  PostQRBuilder();

  PostQRBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _idJadwal = $v.idJadwal;
      _qrCode = $v.qrCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostQR other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostQR;
  }

  @override
  void update(void Function(PostQRBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostQR build() => _build();

  _$PostQR _build() {
    final _$result = _$v ??
        new _$PostQR._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, r'PostQR', 'accessToken'),
            idJadwal: BuiltValueNullFieldError.checkNotNull(
                idJadwal, r'PostQR', 'idJadwal'),
            qrCode: BuiltValueNullFieldError.checkNotNull(
                qrCode, r'PostQR', 'qrCode'));
    replace(_$result);
    return _$result;
  }
}

class _$SubmitPerkuliahan extends SubmitPerkuliahan {
  @override
  final String accessToken;
  @override
  final int idJadwal;

  factory _$SubmitPerkuliahan(
          [void Function(SubmitPerkuliahanBuilder)? updates]) =>
      (new SubmitPerkuliahanBuilder()..update(updates))._build();

  _$SubmitPerkuliahan._({required this.accessToken, required this.idJadwal})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, r'SubmitPerkuliahan', 'accessToken');
    BuiltValueNullFieldError.checkNotNull(
        idJadwal, r'SubmitPerkuliahan', 'idJadwal');
  }

  @override
  SubmitPerkuliahan rebuild(void Function(SubmitPerkuliahanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmitPerkuliahanBuilder toBuilder() =>
      new SubmitPerkuliahanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubmitPerkuliahan &&
        accessToken == other.accessToken &&
        idJadwal == other.idJadwal;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, accessToken.hashCode), idJadwal.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubmitPerkuliahan')
          ..add('accessToken', accessToken)
          ..add('idJadwal', idJadwal))
        .toString();
  }
}

class SubmitPerkuliahanBuilder
    implements Builder<SubmitPerkuliahan, SubmitPerkuliahanBuilder> {
  _$SubmitPerkuliahan? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  int? _idJadwal;
  int? get idJadwal => _$this._idJadwal;
  set idJadwal(int? idJadwal) => _$this._idJadwal = idJadwal;

  SubmitPerkuliahanBuilder();

  SubmitPerkuliahanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _idJadwal = $v.idJadwal;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubmitPerkuliahan other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubmitPerkuliahan;
  }

  @override
  void update(void Function(SubmitPerkuliahanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubmitPerkuliahan build() => _build();

  _$SubmitPerkuliahan _build() {
    final _$result = _$v ??
        new _$SubmitPerkuliahan._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, r'SubmitPerkuliahan', 'accessToken'),
            idJadwal: BuiltValueNullFieldError.checkNotNull(
                idJadwal, r'SubmitPerkuliahan', 'idJadwal'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
