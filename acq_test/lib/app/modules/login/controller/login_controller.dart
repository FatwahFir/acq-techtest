import 'package:acq_test/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/auth_repositories.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthRepository _authRepository = AuthRepository();
  var isLoading = false.obs;

  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email dan Password harus diisi",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    bool success = await _authRepository.login(email, password);
    isLoading.value = false;

    if (success) {
      Get.offNamed(AppRoutes.profile); 
    } else {
      Get.snackbar(
        "Login Gagal",
        "Email atau password salah.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
