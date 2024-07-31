// To parse this JSON data, do
//
//     final planModel = planModelFromJson(jsonString);

import 'dart:convert';

List<PlanModel> planModelFromJson(String str) =>
    List<PlanModel>.from(json.decode(str).map((x) => PlanModel.fromJson(x)));

String planModelToJson(List<PlanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlanModel {
  int? planId;
  String? planName;
  double? price;
  String? description;
  int? planDuration;
  int? advisorId;
  String? fullName;
  int? numberOfUses;
  bool? isApproved;
  bool? isActive;

  PlanModel({
    this.planId,
    this.planName,
    this.price,
    this.description,
    this.planDuration,
    this.advisorId,
    this.fullName,
    this.numberOfUses,
    this.isApproved,
    this.isActive,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        planId: json["planID"],
        planName: json["planName"],
        price: json["price"],
        description: json["description"],
        planDuration: json["planDuration"],
        advisorId: json["advisorID"],
        fullName: json["fullName"],
        numberOfUses: json["numberOfUses"],
        isApproved: json["isApproved"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "planID": planId,
        "planName": planName,
        "price": price,
        "description": description,
        "planDuration": planDuration,
        "advisorID": advisorId,
        "fullName": fullName,
        "numberOfUses": numberOfUses,
        "isApproved": isApproved,
        "isActive": isActive,
      };
}
