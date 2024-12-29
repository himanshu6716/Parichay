import 'dart:convert';
import 'package:parichay/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> login(String email, String password) async {
    // Make API call to authenticate user
    final response = await http.post(
        Uri.parse('https://parichay-zpmq.onrender.com/user/login'),
        body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final authToken = responseData['token'];
      // Store authentication token in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', authToken);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String?> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');

    // Make API call to fetch user role using the authentication token
    final response = await http.get(
      Uri.parse('https://parichay-zpmq.onrender.com/user/login'),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['role'];
    } else {
      throw Exception('Failed to get user role');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
  }
}
