// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromJson(jsonString);

import 'dart:convert';

SendOtpModel sendOtpModelFromJson(String str) => SendOtpModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpModel data) => json.encode(data.toJson());

class SendOtpModel {
  bool success;
  String message;
  String otp;

  SendOtpModel({
    required this.success,
    required this.message,
    required this.otp,
  });

  factory SendOtpModel.fromJson(Map<String, dynamic> json) => SendOtpModel(
    success: json["success"],
    message: json["message"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "otp": otp,
  };
}
