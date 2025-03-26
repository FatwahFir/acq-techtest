import 'package:acq_test/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init('test-app');
  
  runApp(
    GetMaterialApp(
      initialRoute: INITIAL_ROUTES,
      title: 'Application',
      getPages: pages,
    )
  );
}


