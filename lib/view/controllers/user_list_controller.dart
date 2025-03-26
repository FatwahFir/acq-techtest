import 'package:acq_test/dto/user.dart';
import 'package:acq_test/services/user_services.dart';
import 'package:acq_test/utils/color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {
  late UserServices _services;

  final users = <User>[].obs;

  @override
  void onInit() {
    _services = UserServices(Dio());
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    getData();
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

  Future<void> getData() async {
    try {
      final response = await _services.getUser(1);
      final List rawData = response.data['data'] ?? [];
      users.clear();
      users.addAll(rawData.map((e) => User.fromJson(e)).toList());
    } on DioException catch (error) {
      showError(error.response?.data?['error'] ?? 'Failed to get data');
    }
  }
}
