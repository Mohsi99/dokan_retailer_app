
import 'dart:convert';

import 'package:dokan_retailer_app/model/user_model.dart';

import 'Register_Model.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool success;
  final String message;
  final User user;
  final String token;

  LoginModel({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    user: User.fromJson(json["user"]),
    token: json["token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user": user.toJson(),
    "token": token,
  };

  LoginModel copyWith({
    bool? success,
    String? message,
    User? user,
    String? token,
  }) =>
      LoginModel(
        success: success ?? this.success,
        message: message ?? this.message,
        user: user ?? this.user,
        token: token ?? this.token,
      );
}

