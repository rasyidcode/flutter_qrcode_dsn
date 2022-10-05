// GENERATED CODE - DO NOT MODIFY BY HAND

part of perkuliahan_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PerkuliahanItem> _$perkuliahanItemSerializer =
    new _$PerkuliahanItemSerializer();

class _$PerkuliahanItemSerializer
    implements StructuredSerializer<PerkuliahanItem> {
  @override
  final Iterable<Type> types = const [PerkuliahanItem, _$PerkuliahanItem];
  @override
  final String wireName = 'PerkuliahanItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, PerkuliahanItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id_jadwal',
      serializers.serialize(object.idJadwal,
          specifiedType: const FullType(String)),
      'tgl_jadwal',
      serializers.serialize(object.tglJadwal,
          specifiedType: const FullType(String)),
      'kode_matkul',
      serializers.serialize(object.kodeMatkul,
          specifiedType: const FullType(String)),
      'nama_matkul',
      serializers.serialize(object.namaMatkul,
          specifiedType: const FullType(String)),
      'begin_time',
      serializers.serialize(object.beginTime,
          specifiedType: const FullType(String)),
      'end_time',
      serializers.serialize(object.endTime,
          specifiedType: const FullType(String)),
      'status_perkuliahan',
      serializers.serialize(object.statusPerkuliahan,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PerkuliahanItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PerkuliahanItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id_jadwal':
          result.idJadwal = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'tgl_jadwal':
          result.tglJadwal = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'kode_matkul':
          result.kodeMatkul = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nama_matkul':
          result.namaMatkul = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'begin_time':
          result.beginTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'status_perkuliahan':
          result.statusPerkuliahan = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PerkuliahanItem extends PerkuliahanItem {
  @override
  final String idJadwal;
  @override
  final String tglJadwal;
  @override
  final String kodeMatkul;
  @override
  final String namaMatkul;
  @override
  final String beginTime;
  @override
  final String endTime;
  @override
  final String statusPerkuliahan;

  factory _$PerkuliahanItem([void Function(PerkuliahanItemBuilder)? updates]) =>
      (new PerkuliahanItemBuilder()..update(updates))._build();

  _$PerkuliahanItem._(
      {required this.idJadwal,
      required this.tglJadwal,
      required this.kodeMatkul,
      required this.namaMatkul,
      required this.beginTime,
      required this.endTime,
      required this.statusPerkuliahan})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        idJadwal, r'PerkuliahanItem', 'idJadwal');
    BuiltValueNullFieldError.checkNotNull(
        tglJadwal, r'PerkuliahanItem', 'tglJadwal');
    BuiltValueNullFieldError.checkNotNull(
        kodeMatkul, r'PerkuliahanItem', 'kodeMatkul');
    BuiltValueNullFieldError.checkNotNull(
        namaMatkul, r'PerkuliahanItem', 'namaMatkul');
    BuiltValueNullFieldError.checkNotNull(
        beginTime, r'PerkuliahanItem', 'beginTime');
    BuiltValueNullFieldError.checkNotNull(
        endTime, r'PerkuliahanItem', 'endTime');
    BuiltValueNullFieldError.checkNotNull(
        statusPerkuliahan, r'PerkuliahanItem', 'statusPerkuliahan');
  }

  @override
  PerkuliahanItem rebuild(void Function(PerkuliahanItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PerkuliahanItemBuilder toBuilder() =>
      new PerkuliahanItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PerkuliahanItem &&
        idJadwal == other.idJadwal &&
        tglJadwal == other.tglJadwal &&
        kodeMatkul == other.kodeMatkul &&
        namaMatkul == other.namaMatkul &&
        beginTime == other.beginTime &&
        endTime == other.endTime &&
        statusPerkuliahan == other.statusPerkuliahan;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, idJadwal.hashCode), tglJadwal.hashCode),
                        kodeMatkul.hashCode),
                    namaMatkul.hashCode),
                beginTime.hashCode),
            endTime.hashCode),
        statusPerkuliahan.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PerkuliahanItem')
          ..add('idJadwal', idJadwal)
          ..add('tglJadwal', tglJadwal)
          ..add('kodeMatkul', kodeMatkul)
          ..add('namaMatkul', namaMatkul)
          ..add('beginTime', beginTime)
          ..add('endTime', endTime)
          ..add('statusPerkuliahan', statusPerkuliahan))
        .toString();
  }
}

class PerkuliahanItemBuilder
    implements Builder<PerkuliahanItem, PerkuliahanItemBuilder> {
  _$PerkuliahanItem? _$v;

  String? _idJadwal;
  String? get idJadwal => _$this._idJadwal;
  set idJadwal(String? idJadwal) => _$this._idJadwal = idJadwal;

  String? _tglJadwal;
  String? get tglJadwal => _$this._tglJadwal;
  set tglJadwal(String? tglJadwal) => _$this._tglJadwal = tglJadwal;

  String? _kodeMatkul;
  String? get kodeMatkul => _$this._kodeMatkul;
  set kodeMatkul(String? kodeMatkul) => _$this._kodeMatkul = kodeMatkul;

  String? _namaMatkul;
  String? get namaMatkul => _$this._namaMatkul;
  set namaMatkul(String? namaMatkul) => _$this._namaMatkul = namaMatkul;

  String? _beginTime;
  String? get beginTime => _$this._beginTime;
  set beginTime(String? beginTime) => _$this._beginTime = beginTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  String? _statusPerkuliahan;
  String? get statusPerkuliahan => _$this._statusPerkuliahan;
  set statusPerkuliahan(String? statusPerkuliahan) =>
      _$this._statusPerkuliahan = statusPerkuliahan;

  PerkuliahanItemBuilder();

  PerkuliahanItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idJadwal = $v.idJadwal;
      _tglJadwal = $v.tglJadwal;
      _kodeMatkul = $v.kodeMatkul;
      _namaMatkul = $v.namaMatkul;
      _beginTime = $v.beginTime;
      _endTime = $v.endTime;
      _statusPerkuliahan = $v.statusPerkuliahan;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PerkuliahanItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PerkuliahanItem;
  }

  @override
  void update(void Function(PerkuliahanItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PerkuliahanItem build() => _build();

  _$PerkuliahanItem _build() {
    final _$result = _$v ??
        new _$PerkuliahanItem._(
            idJadwal: BuiltValueNullFieldError.checkNotNull(
                idJadwal, r'PerkuliahanItem', 'idJadwal'),
            tglJadwal: BuiltValueNullFieldError.checkNotNull(
                tglJadwal, r'PerkuliahanItem', 'tglJadwal'),
            kodeMatkul: BuiltValueNullFieldError.checkNotNull(
                kodeMatkul, r'PerkuliahanItem', 'kodeMatkul'),
            namaMatkul: BuiltValueNullFieldError.checkNotNull(
                namaMatkul, r'PerkuliahanItem', 'namaMatkul'),
            beginTime: BuiltValueNullFieldError.checkNotNull(
                beginTime, r'PerkuliahanItem', 'beginTime'),
            endTime: BuiltValueNullFieldError.checkNotNull(
                endTime, r'PerkuliahanItem', 'endTime'),
            statusPerkuliahan: BuiltValueNullFieldError.checkNotNull(
                statusPerkuliahan, r'PerkuliahanItem', 'statusPerkuliahan'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
