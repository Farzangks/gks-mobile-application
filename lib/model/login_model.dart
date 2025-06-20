// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String id;
  String emailOrMobile;
  String username;
  String token;

  LoginModel({
    required this.id,
    required this.emailOrMobile,
    required this.username,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["_id"],
    emailOrMobile: json["emailOrMobile"],
    username: json["username"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "emailOrMobile": emailOrMobile,
    "username": username,
    "token": token,
  };
}
