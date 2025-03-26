import 'package:acq_test/view/bindings/login_binding.dart';
import 'package:acq_test/view/bindings/user_form_binding.dart';
import 'package:acq_test/view/bindings/user_list_binding.dart';
import 'package:acq_test/view/screens/login_screen.dart';
import 'package:acq_test/view/screens/user_form_screen.dart';
import 'package:acq_test/view/screens/user_list_screen.dart';
import 'package:get/get.dart';

const INITIAL_ROUTES = '/login';

final List<GetPage> pages = [
  GetPage(
    name: '/login',
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: '/user',
    page: () => const UserListScreen(),
    binding: UserListBinding(),
  ),
  GetPage(
    name: '/user-form',
    page: () => UserFormScreen(),
    binding: UserFormBinding(),
  ),
];
