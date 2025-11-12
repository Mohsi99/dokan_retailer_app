import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Register_Model.dart';
import '../model/user_model.dart';
import '../service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isLoggedIn = false;
  User? _currentUser;
  String? _token;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  User? get currentUser => _currentUser;
  String? get token => _token;
  String? get errorMessage => _errorMessage;

  static const String tokenKey = 'auth_token';
  static const String userDataKey = 'user_data';

  AuthProvider() {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString(tokenKey);
      final userDataString = prefs.getString(userDataKey);

      if (_token != null && userDataString != null) {
        final userData = json.decode(userDataString);
        _currentUser = User.fromJson(userData);
        _isLoggedIn = true;
      }
      notifyListeners();
    } catch (e) {
      _isLoggedIn = false;
      notifyListeners();
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String shopName,
    required String shopAddress,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final registerModel = await AuthService.register(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        shopName: shopName,
        shopAddress: shopAddress,
      );

      if (registerModel.success) {
        _currentUser = registerModel.user;
        await _saveUserData(registerModel.user);
        _isLoggedIn = true;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = registerModel.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final loginModel = await AuthService.login(
        email: email,
        password: password,
      );

      if (loginModel.success) {
        _token = loginModel.token;
        _currentUser = loginModel.user;
        await _saveToken(loginModel.token);
        await _saveUserData(loginModel.user);
        _isLoggedIn = true;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = loginModel.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(tokenKey);
      await prefs.remove(userDataKey);

      _token = null;
      _currentUser = null;
      _isLoggedIn = false;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  Future<void> _saveUserData(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userDataKey, json.encode(user.toJson()));
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}