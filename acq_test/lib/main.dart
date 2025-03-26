import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  await GetStorage.init();

  final box = GetStorage();
  String? token = box.read('token');

  runApp(MainApp(isLoggedIn: token != null));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo for test acq',
      initialRoute: isLoggedIn ? AppRoutes.profile : AppRoutes.login,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
