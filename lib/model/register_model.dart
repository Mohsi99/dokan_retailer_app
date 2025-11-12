import 'dart:convert';

import 'package:dokan_retailer_app/model/user_model.dart';

import 'Register_Model.dart';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final bool success;
  final String message;
  final User user;

  RegisterModel({
    required this.success,
    required this.message,
    required this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user": user.toJson(),
  };

  RegisterModel copyWith({
    bool? success,
    String? message,
    User? user,
  }) =>
      RegisterModel(
        success: success ?? this.success,
        message: message ?? this.message,
        user: user ?? this.user,
      );
}