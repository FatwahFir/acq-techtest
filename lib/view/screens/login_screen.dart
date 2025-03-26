import 'package:acq_test/utils/color.dart';
import 'package:acq_test/view/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(0, 245, 241, 241)),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Make This App Yours'),
                    const Text(
                      'Login',
                      style: TextStyle(color: Colors.grey, fontSize: 24),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                       validator: (value) {
                        if(value == null || value.isEmpty  ) {
                          return 'Email is required';
                        }
                        return null;
                      },
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: null,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 12),
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(fontSize: 14, color: ColorApp.gray1),
                        hintText: 'jhon.doe@gmail.com',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: ColorApp.gray1,
                            fontWeight: FontWeight.w400),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorApp.gray1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorApp.gray2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if(value == null || value.isEmpty  ) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      controller: controller.password,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 12),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(fontSize: 14, color: ColorApp.gray1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorApp.gray1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorApp.gray2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () => controller.login(),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: ColorApp.gray1)),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: ColorApp.gray1,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
