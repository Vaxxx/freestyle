// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.stagename,
    required this.age,
    required this.email,
    required this.password,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
  });

  User.login({required this.stagename, required this.password}) {
    stagename = stagename;
    password = password;
  }

  int? id;
  String? stagename;
  String? age;
  String? email;
  String? password;
  List<Role>? roles;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        stagename: json["stagename"],
        age: json["age"],
        email: json["email"],
        password: json["password"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stagename": stagename,
        "age": age,
        "email": email,
        "password": password,
        "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
