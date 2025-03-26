import 'package:acq_test/app/modules/register/binding/register_binding.dart';
import 'package:get/get.dart';
import '../modules/login/view/login_view.dart';
import '../modules/profile/view/profile_view.dart';
import '../modules/register/view/register_view.dart';
import '../modules/login/binding/login_binding.dart';
import '../modules/profile/binding/profile_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
