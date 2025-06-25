import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$AGORA_BASE_URL/users/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final userData = responseBody['user'];

      // Store user_data as a stringified JSON object
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_data', jsonEncode(userData));

      return responseBody;
    } else {
      throw Exception(responseBody['error'] ?? 'Login failed');
    }
  }
}