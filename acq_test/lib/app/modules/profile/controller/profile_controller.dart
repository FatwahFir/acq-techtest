import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/user_repositories.dart';
import '../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  final GetStorage _storage = GetStorage();

  final UserRepository _userRepository = UserRepository();

  var users = <UserModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      users.value = await _userRepository.fetchUsers();
    } catch (e) {
      Get.snackbar("Error", "Gagal memuat pengguna");
    } finally {
      isLoading(false);
    }
  }

  void logout() {
    _storage.remove('token'); // Hapus token dari storage
    Get.offNamed(AppRoutes.login); // Navigasi ke halaman login
  }
}
