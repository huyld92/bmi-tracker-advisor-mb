// To parse this JSON data, do
//
//     final certificateModel = certificateModelFromJson(jsonString);

import 'dart:convert';

List<CertificateModel> certificateModelFromJson(String str) =>
    List<CertificateModel>.from(
        json.decode(str).map((x) => CertificateModel.fromJson(x)));

String certificateModelToJson(List<CertificateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CertificateModel {
  int? certificateId;
  String? certificateName;
  String? certificateLink;
  bool? isActive;
  int? advisorId;
  String? accountPhoto;
  String? fullName;

  CertificateModel({
    this.certificateId,
    this.certificateName,
    this.certificateLink,
    this.isActive,
    this.advisorId,
    this.accountPhoto,
    this.fullName,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      CertificateModel(
        certificateId: json["certificateID"],
        certificateName: json["certificateName"],
        certificateLink: json["certificateLink"],
        isActive: json["isActive"],
        advisorId: json["advisorID"],
        accountPhoto: json["accountPhoto"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "certificateID": certificateId,
        "certificateName": certificateName,
        "certificateLink": certificateLink,
        "isActive": isActive,
        "advisorID": advisorId,
        "accountPhoto": accountPhoto,
        "fullName": fullName,
      };
}
