// To parse this JSON data, do
//
//     final servicePricingModel = servicePricingModelFromJson(jsonString);

import 'dart:convert';

ServicePricingModel servicePricingModelFromJson(String str) => ServicePricingModel.fromJson(json.decode(str));

String servicePricingModelToJson(ServicePricingModel data) => json.encode(data.toJson());

class ServicePricingModel {
  String basicCleaning;
  String deepCleaning;

  ServicePricingModel({
    required this.basicCleaning,
    required this.deepCleaning,
  });

  factory ServicePricingModel.fromJson(Map<String, dynamic> json) => ServicePricingModel(
    basicCleaning: json["basic cleaning"],
    deepCleaning: json["deep cleaning"],
  );

  Map<String, dynamic> toJson() => {
    "basic cleaning": basicCleaning,
    "deep cleaning": deepCleaning,
  };
}
