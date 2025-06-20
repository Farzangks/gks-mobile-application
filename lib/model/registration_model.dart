// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
  String id;
  String emailOrMobile;
  String username;
  String token;

  RegistrationModel({
    required this.id,
    required this.emailOrMobile,
    required this.username,
    required this.token,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
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
