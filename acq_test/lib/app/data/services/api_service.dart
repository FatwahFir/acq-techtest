import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  ApiService() {
    if (!kReleaseMode) {
      // Hanya log di debug mode
      _dio.interceptors.add(
        LogInterceptor(request: true, requestBody: true, responseBody: true),
      );
    }
  }

  Future<String> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '/login',
        data: {"email": email, "password": password},
      );

      return response.data['token'];
    } catch (e) {
      throw Exception("Login failed. Please check your credentials.");
    }
  }

  Future<Map<String, dynamic>> createUser(String name, String job) async {
    try {
      Response response = await _dio.post(
        '/users',
        data: {"name": name, "job": job},
      );

      return response.data; // Kembalikan response dari API
    } catch (e) {
      throw Exception("Gagal menambahkan pengguna");
    }
  }
}
