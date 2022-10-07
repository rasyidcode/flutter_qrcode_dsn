library mahasiswa_item;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_dsn/data/models/serializers.dart';

part 'mahasiswa_item.g.dart';

abstract class MahasiswaItem
    implements Built<MahasiswaItem, MahasiswaItemBuilder> {
  String get id;
  String get nim;
  @BuiltValueField(wireName: 'nama_lengkap')
  String get namaLengkap;
  @BuiltValueField(wireName: 'status_presensi')
  String get statusPresensi;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  MahasiswaItem._();

  factory MahasiswaItem([Function(MahasiswaItemBuilder b) updates]) =
      _$MahasiswaItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(MahasiswaItem.serializer, this));
  }

  static MahasiswaItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        MahasiswaItem.serializer, json.decode(jsonString));
  }

  static Serializer<MahasiswaItem> get serializer => _$mahasiswaItemSerializer;
}
