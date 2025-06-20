import 'dart:convert';

List<ServiceModel> serviceModelListFromJson(String str) =>
    List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

ServiceModel serviceModelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  String id;
  String name;
  String email;
  String mobile;
  String serviceType;
  String location;
  String date;
  String time;
  bool status;
  dynamic paymentId;
  dynamic orderId;
  dynamic receipt;
  String paymentStatus;
  dynamic otp;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? category;  // Optional fields if they exist in your model
  String? subCategory;
  String? finalSelection;

  ServiceModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.serviceType,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
    this.paymentId,
    this.orderId,
    this.receipt,
    required this.paymentStatus,
    this.otp,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.category,
    this.subCategory,
    this.finalSelection,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    mobile: json["mobile"] ?? "",
    serviceType: json["serviceType"] ?? "",
    location: json["location"] ?? "",
    date: json["date"] ?? "",
    time: json["time"] ?? "",
    status: json["status"] ?? false,
    paymentId: json["paymentId"],
    orderId: json["orderId"],
    receipt: json["receipt"],
    paymentStatus: json["paymentStatus"] ?? "pending",
    otp: json["otp"],
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : DateTime.now(),
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : DateTime.now(),
    v: json["__v"] ?? 0,
    category: json["category"],
    subCategory: json["subCategory"],
    finalSelection: json["finalSelection"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "mobile": mobile,
    "serviceType": serviceType,
    "location": location,
    "date": date,
    "time": time,
    "status": status,
    "paymentId": paymentId,
    "orderId": orderId,
    "receipt": receipt,
    "paymentStatus": paymentStatus,
    "otp": otp,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "category": category,
    "subCategory": subCategory,
    "finalSelection": finalSelection,
  };
}