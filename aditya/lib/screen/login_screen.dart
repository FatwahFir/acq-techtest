import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003366),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Login to your account",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
              SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email, color: Color(0xFF003366)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xFF003366), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Obx(
                () => TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF003366)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFF003366),
                      ),
                      onPressed: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFF003366),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () =>
                    authController.isLoading.value
                        ? Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF003366),
                          ),
                        )
                        : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                () => authController.login(
                                  emailController.text,
                                  passwordController.text,
                                ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF003366),
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
