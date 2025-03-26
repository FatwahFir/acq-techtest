import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class UserRepository extends GetConnect {
  final ApiService _apiService = ApiService();
  Future<List<UserModel>> fetchUsers() async {
    final response = await get('https://reqres.in/api/users?page=1');

    if (response.statusCode == 200) {
      List<dynamic> data = response.body['data'];
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception("Gagal mengambil data pengguna");
    }
  }

  Future<Map<String, dynamic>> addUser(String name, String job) async {
    return await _apiService.createUser(name, job);
  }
}
