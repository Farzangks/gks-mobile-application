// To parse this JSON data, do
//
//     final sellPropertyModel = sellPropertyModelFromJson(jsonString);

import 'dart:convert';

SellPropertyModel sellPropertyModelFromJson(String str) => SellPropertyModel.fromJson(json.decode(str));

String sellPropertyModelToJson(SellPropertyModel data) => json.encode(data.toJson());

class SellPropertyModel {
  String message;
  Property property;

  SellPropertyModel({
    required this.message,
    required this.property,
  });

  factory SellPropertyModel.fromJson(Map<String, dynamic> json) => SellPropertyModel(
    message: json["message"],
    property: Property.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "property": property.toJson(),
  };
}

class Property {
  String name;
  String email;
  String mobileNumber;
  String location;
  String propertyType;
  List<String> images;
  String id;
  String createdAt;
  String updatedAt;
  int v;

  Property({
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.location,
    required this.propertyType,
    required this.images,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    location: json["location"],
    propertyType: json["propertyType"],
    images: List<String>.from(json["images"].map((x) => x)),
    id: json["_id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobileNumber": mobileNumber,
    "location": location,
    "propertyType": propertyType,
    "images": List<dynamic>.from(images.map((x) => x)),
    "_id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
