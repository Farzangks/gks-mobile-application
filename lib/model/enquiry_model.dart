// To parse this JSON data, do
//
//     final enquiryModel = enquiryModelFromJson(jsonString);

import 'dart:convert';

EnquiryModel enquiryModelFromJson(String str) => EnquiryModel.fromJson(json.decode(str));

String enquiryModelToJson(EnquiryModel data) => json.encode(data.toJson());

class EnquiryModel {
  String name;
  String enquiryModelId;
  String mobile;
  String email;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  EnquiryModel({
    required this.name,
    required this.enquiryModelId,
    required this.mobile,
    required this.email,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory EnquiryModel.fromJson(Map<String, dynamic> json) => EnquiryModel(
    name: json["name"],
    enquiryModelId: json["id"],
    mobile: json["Mobile"],
    email: json["email"],
    id: json["_id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": enquiryModelId,
    "Mobile": mobile,
    "email": email,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
