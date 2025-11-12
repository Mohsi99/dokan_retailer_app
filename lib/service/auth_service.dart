import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Register_Model.dart';
import '../model/login_model.dart';

class AuthService {
  static const String baseUrl = 'https://karyana-apis-backend.vercel.app';
  static const String loginEndpoint = '/api/users/login';
  static const String registerEndpoint = '/api/users/register';

  static Future<RegisterModel> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String shopName,
    required String shopAddress,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$registerEndpoint');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'shopName': shopName,
          'shopAddress': shopAddress,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final registerModel = registerModelFromJson(response.body);

        if (registerModel.success) {
          return registerModel;
        } else {
          throw Exception(registerModel.message);
        }
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Registration failed');
      }
    } catch (e) {
      throw Exception('Registration error: ${e.toString()}');
    }
  }

  static Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$loginEndpoint');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final loginModel = loginModelFromJson(response.body);

        if (loginModel.success) {
          return loginModel;
        } else {
          throw Exception(loginModel.message);
        }
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Login failed');
      }
    } catch (e) {
      throw Exception('Login error: ${e.toString()}');
    }
  }

  static Future<Map<String, String>> getAuthHeaders(String token) async {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}