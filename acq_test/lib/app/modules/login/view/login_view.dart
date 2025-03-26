import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormField(
              builder: (FormFieldState state) {
                return TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
            FormField(
              builder: (FormFieldState state) {
                return TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () => controller.login(),
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
