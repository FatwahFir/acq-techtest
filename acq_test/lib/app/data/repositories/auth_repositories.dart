import 'package:flutter/material.dart';

import '../services/api_service.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();
  final GetStorage _box = GetStorage();

  Future<bool> login(String email, String password) async {
    try {
      String token = await _apiService.login(email, password);

      // Simpan token di GetStorage
      _box.write('token', token);
      debugPrint('Token: $token');
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _box.remove('token');
  }
}
