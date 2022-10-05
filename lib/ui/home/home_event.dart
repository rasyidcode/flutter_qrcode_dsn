library home_event;

import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class GetListMatkul extends HomeEvent
    implements Built<GetListMatkul, GetListMatkulBuilder> {
  String get accessToken;

  GetListMatkul._();

  factory GetListMatkul([Function(GetListMatkulBuilder b) updates]) =
      _$GetListMatkul;
}

abstract class PostQR extends HomeEvent
    implements Built<PostQR, PostQRBuilder> {
  String get accessToken;
  int get idJadwal;
  String get qrCode;

  PostQR._();

  factory PostQR([Function(PostQRBuilder b) updates]) = _$PostQR;
}

abstract class SubmitPerkuliahan extends HomeEvent
    implements Built<SubmitPerkuliahan, SubmitPerkuliahanBuilder> {
  String get accessToken;
  int get idJadwal;

  SubmitPerkuliahan._();

  factory SubmitPerkuliahan([Function(SubmitPerkuliahanBuilder b) updates]) =
      _$SubmitPerkuliahan;
}
