import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "https://reqres.in/api";

  static Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    }
    return null;
  }

  static Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users?page=1'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return [];
  }

  static Future<Map<String, dynamic>?> addUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: {'name': name, 'job': job},
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
