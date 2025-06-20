import 'dart:convert';

FavoriteResponseModel favoriteResponseModelFromJson(String str) => FavoriteResponseModel.fromJson(json.decode(str));

String favoriteResponseModelToJson(FavoriteResponseModel data) => json.encode(data.toJson());

class FavoriteResponseModel {
  bool success;
  String message;
  List<FavoriteProperty>? data;

  FavoriteResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) => FavoriteResponseModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    data: json["data"] != null ? List<FavoriteProperty>.from(json["data"].map((x) => FavoriteProperty.fromJson(x))) : null,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
  };
}

class FavoriteProperty {
  String id;
  String name;
  String detail;
  int price;
  String category;
  String location;
  String type;
  String ownerMobile;
  List<String> images;
  String? video;
  String? map;
  List<String>? deleteUrls;
  String? createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  FavoriteProperty({
    required this.id,
    required this.name,
    required this.detail,
    required this.price,
    required this.category,
    required this.location,
    required this.type,
    required this.ownerMobile,
    required this.images,
    this.video,
    this.map,
    this.deleteUrls,
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory FavoriteProperty.fromJson(Map<String, dynamic> json) => FavoriteProperty(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    detail: json["detail"] ?? "",
    price: json["price"] ?? 0,
    category: json["category"] ?? "",
    location: json["location"] ?? "",
    type: json["type"] ?? "",
    ownerMobile: json["ownerMobile"] ?? "",
    images: List<String>.from(json["images"].map((x) => x)),
    video: json["video"],
    map: json["map"],
    deleteUrls: json["deleteUrls"] != null ? List<String>.from(json["deleteUrls"].map((x) => x)) : null,
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"] ?? 0,
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
    "deleteUrls": deleteUrls != null ? List<dynamic>.from(deleteUrls!.map((x) => x)) : null,
    "createdBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}