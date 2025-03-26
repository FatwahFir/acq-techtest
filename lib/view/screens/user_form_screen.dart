import 'package:acq_test/view/controllers/user_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:acq_test/utils/color.dart';

class UserFormScreen extends GetView<UserFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Add Member',
          style: TextStyle(color: ColorApp.gray1),
        ),
        backgroundColor: Colors.white,
        foregroundColor: ColorApp.gray1,
      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Visibility(
                        visible: controller.member.value != null,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: ColorApp.gray1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${controller.member.value?.id}'),
                              Text('Name: ${controller.member.value?.name}'),
                              Text('Job:${controller.member.value?.job}'),
                              Text(
                                  'Created At: ${controller.member.value?.createdAt}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Add Member'),
                    const SizedBox(height: 30),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      controller: controller.name,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: null,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 12),
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(fontSize: 14, color: ColorApp.gray1),
                        hintText: 'Jhon Doe',
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
                        if (value == null || value.isEmpty) {
                          return 'Job is required';
                        }
                        return null;
                      },
                      controller: controller.job,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 12),
                        labelText: 'Job',
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
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () => controller.save(),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: ColorApp.gray1)),
                              child: Center(
                                child: Text(
                                  'Save',
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
