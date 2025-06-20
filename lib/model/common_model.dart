// To parse this JSON data, do
//
//     final commanModel = commanModelFromJson(jsonString);

import 'dart:convert';

CommonModel commonModelFromJson(String str) => CommonModel.fromJson(json.decode(str));

String commonModelToJson(CommonModel data) => json.encode(data.toJson());

class CommonModel {
  String message;

  CommonModel({
    required this.message,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
