import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepositories {
  static String mainUrl = 'http://192.168.1.158:8000/api';
  var loginUrl = '$mainUrl/mobile/user/login';

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
  ));

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persisteToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password,
    });
    return response.data["token"];
  }
}
