import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/user_repositories.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  final UserRepository _userRepository = UserRepository();
  var isLoading = false.obs;
  var responseMessage = "".obs;

  void addUser() async {
    String name = nameController.text;
    String job = jobController.text;

    if (name.isEmpty || job.isEmpty) {
      Get.snackbar(
        "Error",
        "Nama dan Pekerjaan harus diisi",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading(true);
    try {
      var response = await _userRepository.addUser(name, job);
      responseMessage.value =
          "User Berhasil Ditambahkan:\nID: ${response['id']}\nNama: ${response['name']}\nPekerjaan: ${response['job']}";
    } catch (e) {
      responseMessage.value = "Gagal menambahkan pengguna.";
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    jobController.dispose();
    super.onClose();
  }
}
