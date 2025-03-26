import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Get.back(),
        ),
      ),
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
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Nama',
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
                  controller: controller.jobController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Pekerjaan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
            Obx(
              () =>
                  controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: controller.addUser,
                        child: Text("Tambah Pengguna"),
                      ),
            ),
            SizedBox(height: 20),
            Obx(
              () => Text(
                controller.responseMessage.value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
