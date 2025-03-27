import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    userController.fetchUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text("Users", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF003366),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/addUser'),
            icon: Icon(Icons.add, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              authController.logout();
              Get.offAllNamed('/login');
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Obx(
        () =>
            userController.isLoading.value
                ? Center(
                  child: CircularProgressIndicator(color: Color(0xFF003366)),
                )
                : Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: userController.users.length,
                    itemBuilder: (context, index) {
                      final user = userController.users[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(12),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text(
                            user.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF003366),
                            ),
                          ),
                          subtitle: Text(
                            user.email,
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                      );
                    },
                  ),
                ),
      ),
    );
  }
}
