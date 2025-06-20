// To parse this JSON data, do
//
//     final propertyRentModel = propertyRentModelFromJson(jsonString);

import 'dart:convert';

PropertyRentModel propertyRentModelFromJson(String str) => PropertyRentModel.fromJson(json.decode(str));

String propertyRentModelToJson(PropertyRentModel data) => json.encode(data.toJson());

class PropertyRentModel {
  int page;
  int limit;
  int totalProperties;
  int totalPages;
  List<PropertyRentResource> data;

  PropertyRentModel({
    required this.page,
    required this.limit,
    required this.totalProperties,
    required this.totalPages,
    required this.data,
  });

  factory PropertyRentModel.fromJson(Map<String, dynamic> json) => PropertyRentModel(
    page: json["page"],
    limit: json["limit"],
    totalProperties: json["totalProperties"],
    totalPages: json["totalPages"],
    data: List<PropertyRentResource>.from(json["data"].map((x) => PropertyRentResource.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "totalProperties": totalProperties,
    "totalPages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class PropertyRentResource {
  String id;
  String name;
  String detail;
  int price;
  String category;
  String location;
  String type;
  String ownerMobile;
  List<String> images;
  List<String> deleteUrls;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? video;
  String? map;

  PropertyRentResource({
    required this.id,
    required this.name,
    required this.detail,
    required this.price,
    required this.category,
    required this.location,
    required this.type,
    required this.ownerMobile,
    required this.images,
    required this.deleteUrls,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.video,
    this.map,
  });

  factory PropertyRentResource.fromJson(Map<String, dynamic> json) => PropertyRentResource(
    id: json["_id"],
    name: json["name"],
    detail: json["detail"],
    price: json["price"],
    category: json["category"],
    location: json["location"],
    type: json["type"],
    ownerMobile: json["ownerMobile"],
    images: List<String>.from(json["images"].map((x) => x)),
    deleteUrls: List<String>.from(json["deleteUrls"].map((x) => x)),
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    video: json["video"],
    map: json["map"],
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
    "deleteUrls": List<dynamic>.from(deleteUrls.map((x) => x)),
    "createdBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "video": video,
    "map": map,
  };
}
