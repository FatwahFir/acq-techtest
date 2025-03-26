import 'package:acq_test/utils/color.dart';
import 'package:acq_test/view/controllers/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

const Color primaryColor = Colors.black;
const Color secondaryColor = Colors.white;
const Color borderColor = Colors.grey;

class UserListScreen extends GetView<UserListController> {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: TextStyle(color: ColorApp.gray1),
        ),
        backgroundColor: Colors.white,
        foregroundColor: ColorApp.gray1,
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];
            return Card(
              color: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: borderColor, width: 1),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(
                  '${user.firstName} ${user.lastName}',
                  style: const TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(user.email,
                    style: const TextStyle(color: primaryColor)),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/user-form'),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            // shape: BoxShape.rectangle,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8), // Border abu-abu
            color: Colors.transparent, // Transparan
          ),
          child: const Icon(Icons.add, color: primaryColor),
        ),
      ),
    );
  }
}
