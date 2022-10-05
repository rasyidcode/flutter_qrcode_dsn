import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_presensi_dsn/data/execptions/api_access_error_exception.dart';
import 'package:flutter_presensi_dsn/data/execptions/api_expired_token_exception.dart';
import 'package:flutter_presensi_dsn/data/models/auth.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_item.dart';
import 'package:flutter_presensi_dsn/data/models/perkuliahan_list.dart';
import 'package:http/http.dart' as http;

const baseApiURL = 'https://presensiapp.my.id/api/v1';

class PresensiAppBackendApi {
  final http.Client _client;

  PresensiAppBackendApi(this._client);

  // auth - login
  Future<Auth?> login({
    required String username,
    required String password,
  }) async {
    final response = await _client.post(Uri.parse('$baseApiURL/auth'),
        body: {'username': username, 'password': password});
    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return Auth.fromJson(response.body);
  }

  // auth - renewToken
  Future<String?> renewAccessToken({required String refreshToken}) async {
    final response = await _client.post(
      Uri.parse('$baseApiURL/auth/renew-token'),
      headers: {
        'Refresh-Token': refreshToken,
      },
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return jsonDecode(response.body)['access_token'];
  }

  // auth - logout
  Future<String?> logout(
      {required String accessToken, required String refreshToken}) async {
    final response = await _client.post(Uri.parse('$baseApiURL/auth/logout'),
        headers: {
          HttpHeaders.authorizationHeader: accessToken,
          'Refresh-Token': refreshToken
        });
    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return jsonDecode(response.body)['message'];
  }

  // perkuliahan - list
  Future<PerkuliahanList?> getPerkuliahanList(
      {required String accessToken}) async {
    final response =
        await _client.get(Uri.parse('$baseApiURL/dosen/perkuliahan'), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $accessToken',
    });
    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        String? decoded = jsonDecode(response.body)['message'];
        if (decoded == null) {
          throw ApiAccessErrorException('Message param doesnt exist');
        }

        if (decoded.contains('Expired token')) {
          throw ApiExpiredTokenExecption('Token is expired');
        }
      } else {
        throw ApiAccessErrorException(jsonDecode(response.body)['message']);
      }
    }

    return PerkuliahanList.fromJson(response.body);
  }

  // perkuliahan - detail
  Future<PerkuliahanItem?> getPerkuliahanItem(
      {required String accessToken, required int idJadwal}) async {
    final response = await _client
        .get(Uri.parse('$baseApiURL/dosen/perkuliahan/$idJadwal'), headers: {
      HttpHeaders.authorizationHeader: accessToken,
    });
    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        String? decoded = jsonDecode(response.body)['message'];
        if (decoded == null) {
          throw ApiAccessErrorException('Message param doesnt exist');
        }

        if (decoded.contains('Expired token')) {
          throw ApiExpiredTokenExecption('Token is expired');
        }
      } else {
        throw ApiAccessErrorException(jsonDecode(response.body)['message']);
      }
    }

    return PerkuliahanItem.fromJson(response.body);
  }

  // perkuliahan - post QR
  Future<String?> postQR(
      {required String accessToken,
      required String qrcode,
      required int idJadwal}) async {
    final response =
        await _client.post(Uri.parse('$baseApiURL/dosen/post-qr'), headers: {
      HttpHeaders.authorizationHeader: accessToken,
    }, body: {
      'qr_secret': qrcode,
      'id_jadwal': idJadwal
    });

    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        String? decoded = jsonDecode(response.body)['message'];
        if (decoded == null) {
          throw ApiAccessErrorException('Message param doesnt exist');
        }

        if (decoded.contains('Expired token')) {
          throw ApiExpiredTokenExecption('Token is expired');
        }
      } else {
        throw ApiAccessErrorException(jsonDecode(response.body)['message']);
      }
    }

    return jsonDecode(response.body)['message'];
  }

  // perkuliahan - submit perkuliahan
  Future<String?> submitPerkuliahan(
      {required String accessToken, required int idJadwal}) async {
    final response = await _client
        .post(Uri.parse('$baseApiURL/dosen/submit-perkuliahan'), headers: {
      HttpHeaders.authorizationHeader: accessToken,
    }, body: {
      'id_jadwal': idJadwal
    });

    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        String? decoded = jsonDecode(response.body)['message'];
        if (decoded == null) {
          throw ApiAccessErrorException('Message param doesnt exist');
        }

        if (decoded.contains('Expired token')) {
          throw ApiExpiredTokenExecption('Token is expired');
        }
      } else {
        throw ApiAccessErrorException(jsonDecode(response.body)['message']);
      }
    }

    return jsonDecode(response.body)['message'];
  }
}
