// GENERATED CODE - DO NOT MODIFY BY HAND

part of mahasiswa_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MahasiswaItem> _$mahasiswaItemSerializer =
    new _$MahasiswaItemSerializer();

class _$MahasiswaItemSerializer implements StructuredSerializer<MahasiswaItem> {
  @override
  final Iterable<Type> types = const [MahasiswaItem, _$MahasiswaItem];
  @override
  final String wireName = 'MahasiswaItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, MahasiswaItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'nim',
      serializers.serialize(object.nim, specifiedType: const FullType(String)),
      'nama_lengkap',
      serializers.serialize(object.namaLengkap,
          specifiedType: const FullType(String)),
      'status_presensi',
      serializers.serialize(object.statusPresensi,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MahasiswaItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MahasiswaItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nim':
          result.nim = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nama_lengkap':
          result.namaLengkap = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'status_presensi':
          result.statusPresensi = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MahasiswaItem extends MahasiswaItem {
  @override
  final String id;
  @override
  final String nim;
  @override
  final String namaLengkap;
  @override
  final String statusPresensi;
  @override
  final String createdAt;

  factory _$MahasiswaItem([void Function(MahasiswaItemBuilder)? updates]) =>
      (new MahasiswaItemBuilder()..update(updates))._build();

  _$MahasiswaItem._(
      {required this.id,
      required this.nim,
      required this.namaLengkap,
      required this.statusPresensi,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'MahasiswaItem', 'id');
    BuiltValueNullFieldError.checkNotNull(nim, r'MahasiswaItem', 'nim');
    BuiltValueNullFieldError.checkNotNull(
        namaLengkap, r'MahasiswaItem', 'namaLengkap');
    BuiltValueNullFieldError.checkNotNull(
        statusPresensi, r'MahasiswaItem', 'statusPresensi');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'MahasiswaItem', 'createdAt');
  }

  @override
  MahasiswaItem rebuild(void Function(MahasiswaItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MahasiswaItemBuilder toBuilder() => new MahasiswaItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MahasiswaItem &&
        id == other.id &&
        nim == other.nim &&
        namaLengkap == other.namaLengkap &&
        statusPresensi == other.statusPresensi &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), nim.hashCode), namaLengkap.hashCode),
            statusPresensi.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MahasiswaItem')
          ..add('id', id)
          ..add('nim', nim)
          ..add('namaLengkap', namaLengkap)
          ..add('statusPresensi', statusPresensi)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class MahasiswaItemBuilder
    implements Builder<MahasiswaItem, MahasiswaItemBuilder> {
  _$MahasiswaItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _nim;
  String? get nim => _$this._nim;
  set nim(String? nim) => _$this._nim = nim;

  String? _namaLengkap;
  String? get namaLengkap => _$this._namaLengkap;
  set namaLengkap(String? namaLengkap) => _$this._namaLengkap = namaLengkap;

  String? _statusPresensi;
  String? get statusPresensi => _$this._statusPresensi;
  set statusPresensi(String? statusPresensi) =>
      _$this._statusPresensi = statusPresensi;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  MahasiswaItemBuilder();

  MahasiswaItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nim = $v.nim;
      _namaLengkap = $v.namaLengkap;
      _statusPresensi = $v.statusPresensi;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MahasiswaItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MahasiswaItem;
  }

  @override
  void update(void Function(MahasiswaItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MahasiswaItem build() => _build();

  _$MahasiswaItem _build() {
    final _$result = _$v ??
        new _$MahasiswaItem._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'MahasiswaItem', 'id'),
            nim: BuiltValueNullFieldError.checkNotNull(
                nim, r'MahasiswaItem', 'nim'),
            namaLengkap: BuiltValueNullFieldError.checkNotNull(
                namaLengkap, r'MahasiswaItem', 'namaLengkap'),
            statusPresensi: BuiltValueNullFieldError.checkNotNull(
                statusPresensi, r'MahasiswaItem', 'statusPresensi'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'MahasiswaItem', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
