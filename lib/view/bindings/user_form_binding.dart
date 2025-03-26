import 'package:acq_test/view/controllers/user_form_controller.dart';
import 'package:get/get.dart';

class UserFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserFormController(),
    );
  }
}
