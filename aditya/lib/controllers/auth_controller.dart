import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var token = "".obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    String? result = await ApiService.login(email, password);

    if (result != null) {
      token.value = result;
      Get.offAllNamed('/home');
    } else {
      Get.snackbar(
        "Login Gagal",
        "Email atau password yang Anda masukkan salah.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        icon: Icon(Icons.error, color: Colors.white),
        duration: Duration(seconds: 3),
      );
    }

    isLoading.value = false;
  }

  void logout() {
    print("User logged out");
  }
}
