// To parse this JSON data, do
//
//     final propertyByCategoriesModel = propertyByCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<PropertyByCategoriesModel> propertyByCategoriesModelFromJson(String str) => List<PropertyByCategoriesModel>.from(json.decode(str).map((x) => PropertyByCategoriesModel.fromJson(x)));

String propertyByCategoriesModelToJson(List<PropertyByCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertyByCategoriesModel {
  String id;
  String name;
  String detail;
  int price;
  String category;
  String location;
  String type;
  String ownerMobile;
  List<String> images;
  String video;
  String map;
  List<String> deleteUrls;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  PropertyByCategoriesModel({
    required this.id,
    required this.name,
    required this.detail,
    required this.price,
    required this.category,
    required this.location,
    required this.type,
    required this.ownerMobile,
    required this.images,
    required this.video,
    required this.map,
    required this.deleteUrls,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory PropertyByCategoriesModel.fromJson(Map<String, dynamic> json) => PropertyByCategoriesModel(
    id: json["_id"],
    name: json["name"],
    detail: json["detail"],
    price: json["price"],
    category: json["category"],
    location: json["location"],
    type: json["type"],
    ownerMobile: json["ownerMobile"],
    images: List<String>.from(json["images"].map((x) => x)),
    video: json["video"],
    map: json["map"],
    deleteUrls: List<String>.from(json["deleteUrls"].map((x) => x)),
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "detail": detail,
    "price": price,
    "category": category,
    "location": location,
    "type": type,
    "ownerMobile": ownerMobile,
    "images": List<dynamic>.from(images.map((x) => x)),
    "video": video,
    "map": map,
    "deleteUrls": List<dynamic>.from(deleteUrls.map((x) => x)),
    "createdBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
