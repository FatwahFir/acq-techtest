import 'dart:developer';

import 'package:acq_test/dto/login.dart';
import 'package:acq_test/services/user_services.dart';
import 'package:acq_test/utils/color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final service = UserServices(Dio());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void showError(String message) {
    Get.snackbar(
      'Something Wrong',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 10,
      borderColor: ColorApp.gray2,
      borderWidth: 1,
    );
  }

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      showError('Please fill all data');
      return;
    }

    try {
      final response = await service.login(
        Login(email: email.text, password: password.text),
      );

      final box = GetStorage();
      await box.write('token', response.data['token']);
      Get.toNamed('/user');
    } on DioException catch (error) {
      showError(error.response?.data?['error'] ?? 'Login Failed');
    }
  }
}
