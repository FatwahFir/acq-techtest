import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import 'package:flutter/material.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;

  void fetchUsers() async {
    isLoading.value = true;
    List<dynamic> data = await ApiService.fetchUsers();
    users.value = data.map((json) => User.fromJson(json)).toList();
    isLoading.value = false;
  }

  Future<void> addUser(String name, String job) async {
    var response = await ApiService.addUser(name, job);

    if (response != null) {
      Get.snackbar(
        "Success",
        "User added: ${response['name']} - ${response['job']}\nID: ${response['id']}, Created at: ${response['createdAt']}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: Icon(Icons.check_circle, color: Colors.white),
        margin: EdgeInsets.all(12),
        borderRadius: 8,
        duration: Duration(seconds: 5),
      );
      users.add(User.fromJson(response));
    } else {
      Get.snackbar(
        "Error",
        "Failed to add user. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: Icon(Icons.error, color: Colors.white),
        margin: EdgeInsets.all(12),
        borderRadius: 8,
        duration: Duration(seconds: 3),
      );
    }
  }
}
