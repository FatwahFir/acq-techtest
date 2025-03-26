import 'package:acq_test/dto/member.dart';
import 'package:acq_test/services/user_services.dart';
import 'package:acq_test/utils/color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormController extends GetxController {
  final _service = UserServices(Dio());

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final job = TextEditingController();

  final member = Rxn<Member>();

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

  void showPopup(String status, String message) {
    Get.snackbar(
      status,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      borderRadius: 10,
      borderColor: ColorApp.gray2,
      borderWidth: 1,
    );
  }

  Future<void> save() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      showPopup('Failed to validate data', 'Please fill all data');
      return;
    }

    try {
      final response = await _service.createMember(
        Member(name: name.text, job: job.text),
      );

      showPopup('Success', 'Success to create new member');
      name.text = '';
      job.text = '';

      member.value = Member.fromJson(response.data);
    } on DioException catch (error) {
      showPopup(
          'Something Wrong!', error.response?.data?['error'] ?? 'Failed to save data');
    }
  }
}
