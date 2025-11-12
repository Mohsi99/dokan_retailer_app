import 'dart:convert';

 class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String shopName;
  final String shopAddress;
  final String phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.shopName,
    required this.shopAddress,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    password: json["password"] ?? "",
    shopName: json["shopName"] ?? "",
    shopAddress: json["shopAddress"] ?? "",
    phoneNumber: json["phoneNumber"] ?? json[" phoneNumber"] ?? "",
    createdAt: json["createdAt"] != null
        ? DateTime.parse(json["createdAt"])
        : DateTime.now(),
    updatedAt: json["updatedAt"] != null
        ? DateTime.parse(json["updatedAt"])
        : DateTime.now(),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "shopName": shopName,
    "shopAddress": shopAddress,
    "phoneNumber": phoneNumber,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? shopName,
    String? shopAddress,
    String? phoneNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        shopName: shopName ?? this.shopName,
        shopAddress: shopAddress ?? this.shopAddress,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );
}

// ==================== LOGIN MODEL ====================
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

