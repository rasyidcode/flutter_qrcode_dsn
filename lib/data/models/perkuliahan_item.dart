library perkuliahan_item;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_dsn/data/models/mahasiswa_item.dart';
import 'package:flutter_presensi_dsn/data/models/serializers.dart';

part 'perkuliahan_item.g.dart';

abstract class PerkuliahanItem
    implements Built<PerkuliahanItem, PerkuliahanItemBuilder> {
  @BuiltValueField(wireName: 'id_jadwal')
  String get idJadwal;
  @BuiltValueField(wireName: 'tgl_jadwal')
  String get tglJadwal;
  @BuiltValueField(wireName: 'kode_matkul')
  String get kodeMatkul;
  @BuiltValueField(wireName: 'nama_matkul')
  String get namaMatkul;
  @BuiltValueField(wireName: 'begin_time')
  String get beginTime;
  @BuiltValueField(wireName: 'end_time')
  String get endTime;
  @BuiltValueField(wireName: 'status_perkuliahan')
  String get statusPerkuliahan;
  @BuiltValueField(wireName: 'qr_secret')
  String? get qrsecret;
  @BuiltValueField(wireName: 'mahasiswa')
  BuiltList<MahasiswaItem> get mahasiswa;

  PerkuliahanItem._();

  factory PerkuliahanItem([Function(PerkuliahanItemBuilder b) updates]) =
      _$PerkuliahanItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(PerkuliahanItem.serializer, this));
  }

  static PerkuliahanItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PerkuliahanItem.serializer, json.decode(jsonString));
  }

  static Serializer<PerkuliahanItem> get serializer =>
      _$perkuliahanItemSerializer;
}
