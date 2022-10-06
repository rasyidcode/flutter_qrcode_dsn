import 'package:jwt_decode/jwt_decode.dart';

extension StringExtensions on String {
  Map<String, dynamic> jwtDecode() {
    return Jwt.parseJwt(this);
  }
}
