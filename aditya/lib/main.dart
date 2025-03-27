import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/login_screen.dart';
import 'screen/home_screen.dart';
import 'screen/add_user_screen.dart';
import 'controllers/auth_controller.dart';
import 'controllers/user_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(UserController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ACQ Tech Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/addUser', page: () => AddUserPage()),
      ],
    );
  }
}
