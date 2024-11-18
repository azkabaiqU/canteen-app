import 'dart:convert';

class AuthResponseModel {
  final String token;
  final User user;

  AuthResponseModel({
    required this.token,
    required this.user,
  });

  factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "token": token,
    "user": user.toJson(),
  };
}
class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] as int,
    name: json["name"] as String,
    email: json["email"] as String,
    phone: json["phone"] as String?,
    role: json["role"] as String,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "role": role,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
