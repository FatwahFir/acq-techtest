import 'package:acq_test/view/controllers/user_list_controller.dart';
import 'package:get/get.dart';

class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserListController(),
    );
  }
}
