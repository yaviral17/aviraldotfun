import 'dart:convert';
import 'dart:developer';

class UserDataModel {
  String phone;
  String name;
  String status;
  DateTime iat;
  DateTime exp;
  String token;

  UserDataModel({
    required this.name,
    required this.status,
    required this.iat,
    required this.exp,
    required this.token,
    required this.phone,
  });

  factory UserDataModel.fromJwt(String jwt) {
    List<String> parts = jwt.split(".");
    String payload = parts[1];
    payload = payload.replaceAll('-', '+').replaceAll('_', '/');
    switch (payload.length % 4) {
      case 0:
        break;
      case 2:
        payload += '==';
        break;
      case 3:
        payload += '=';
        break;
      default:
        throw Exception('Illegal base64 string!');
    }
    String decoded = utf8.decode(base64Url.decode(payload));
    Map<String, dynamic> data = jsonDecode(decoded);
    //log(data.toString(), name: "User Data");
    return UserDataModel(
      phone: data['username'],
      name: data['name'],
      status: data['status'],
      iat: DateTime.fromMillisecondsSinceEpoch(data['iat'] * 1000),
      exp: DateTime.fromMillisecondsSinceEpoch(data['exp'] * 1000),
      token: jwt,
    );
  }

  @override
  String toString() {
    return 'UserDataModel(name: $name, status: $status, iat: $iat, exp: $exp, token: $token)';
  }

  bool isTokenExpired() {
    return DateTime.now().isAfter(exp);
  }
}
