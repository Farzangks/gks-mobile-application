// To parse this JSON data, do
//
//     final contactUsModel = contactUsModelFromJson(jsonString);

import 'dart:convert';

ContactUsModel contactUsModelFromJson(String str) => ContactUsModel.fromJson(json.decode(str));

String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUsModel {
  String name;
  String mobile;
  String email;
  String query;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  ContactUsModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.query,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    query: json["query"],
    id: json["_id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobile": mobile,
    "email": email,
    "query": query,
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
