// To parse this JSON data, do
//
//     final commisionModel = commisionModelFromJson(jsonString);

import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

List<CommisionModel> commisionModelFromJson(String str) =>
    List<CommisionModel>.from(
        json.decode(str).map((x) => CommisionModel.fromJson(x)));

String commisionModelToJson(List<CommisionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommisionModel {
  int? commissionId;
  double? commissionAmount;
  dynamic? commissionRate;
  dynamic? paidDate;
  DateTime? expectedPaymentDate;
  double? paidAmount;
  String? paymentStatus;
  String? commissionDescription;
  int? advisorId;
  String? advisorName;

  CommisionModel({
    this.commissionId,
    this.commissionAmount,
    this.commissionRate,
    this.paidDate,
    this.expectedPaymentDate,
    this.paidAmount,
    this.paymentStatus,
    this.commissionDescription,
    this.advisorId,
    this.advisorName,
  });

  factory CommisionModel.fromJson(Map<String, dynamic> json) => CommisionModel(
        commissionId: json["commissionID"],
        commissionAmount: json["commissionAmount"],
        commissionRate:
            json["commissionRate"] != null ? json["commissionRate"] : '',
        paidDate:
            json["paidDate"] != null ? DateTime.parse(json["paidDate"]) : '',
        expectedPaymentDate: DateTime.parse(json["expectedPaymentDate"]),
        paidAmount: json["paidAmount"],
        paymentStatus: json["paymentStatus"],
        commissionDescription: json["commissionDescription"] != null
            ? json["commissionDescription"]
            : '',
        advisorId: json["advisorID"],
        advisorName: json["advisorName"],
      );

  Map<String, dynamic> toJson() => {
        "commissionID": commissionId,
        "commissionAmount": commissionAmount,
        "commissionRate": commissionRate,
        "paidDate": paidDate?.toIso8601String(),
        "expectedPaymentDate":
            "${expectedPaymentDate?.year.toString().padLeft(4, '0')}-${expectedPaymentDate?.month.toString().padLeft(2, '0')}-${expectedPaymentDate?.day.toString().padLeft(2, '0')}",
        "paidAmount": paidAmount,
        "paymentStatus": paymentStatus,
        "commissionDescription": commissionDescription,
        "advisorID": advisorId,
        "advisorName": advisorName,
      };
}

extension CommissionModelExtension on CommisionModel {
  String getPaidDate() {
    if (paidDate == "") {
      return paidDate;
    } else {
      DateTime date = DateTime.parse(paidDate.toString());
      return date.format(); // Example format
    }
  }
}
