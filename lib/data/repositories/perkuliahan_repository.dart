import 'package:flutter_presensi_dsn/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_dsn/data/execptions/repository_error_exception.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_list.dart';

class PerkuliahanRepository {
  final PresensiAppBackendApi _presensiAppBackendApi;

  PerkuliahanRepository(this._presensiAppBackendApi);

  Future<PerkuliahanList> getPerkuliahanList(String accessToken) async {
    final perkuliahanList = await _presensiAppBackendApi.getPerkuliahanList(
        accessToken: accessToken);
    if (perkuliahanList == null) {
      throw RepositoryErrorException('Perkuliahan returns null');
    }

    if (perkuliahanList.total == 0) {
      throw RepositoryErrorException('Total is empty');
    }

    if (perkuliahanList.data.isEmpty) {
      throw RepositoryErrorException('Data is empty');
    }

    return perkuliahanList;
  }

  Future<void> postQR(String accessToken, int idJadwal, String qrCode) async {
    final result = await _presensiAppBackendApi.postQR(
        accessToken: accessToken, qrcode: qrCode, idJadwal: idJadwal);

    if (result == null) {
      throw RepositoryErrorException('Message returns null');
    }
  }
}
