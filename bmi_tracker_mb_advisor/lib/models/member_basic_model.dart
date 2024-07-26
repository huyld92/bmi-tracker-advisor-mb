import 'dart:convert';

class MemberBasicModel {
  int? memberID;
  String? email;
  String? accountPhoto;
  String? fullName;
  String? gender;
  String? phoneNumber;
  DateTime? birthday;

  MemberBasicModel({
    this.memberID,
    this.email,
    this.accountPhoto,
    this.fullName,
    this.gender,
    this.phoneNumber,
    this.birthday,
  });

  factory MemberBasicModel.fromJson(Map<String, dynamic> json) {
    return MemberBasicModel(
      memberID: json['memberID'],
      email: json['email'],
      accountPhoto: json['accountPhoto'],
      fullName: json['fullName'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      birthday: json['birthday'] != null
          ? DateTime.parse(json['birthday'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberID': memberID,
      'email': email,
      'accountPhoto': accountPhoto,
      'fullName': fullName,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'birthday': birthday?.toIso8601String(),
    };
  }
}

List<MemberBasicModel> memberBasicModelsFromJson(String str) =>
    List<MemberBasicModel>.from(json.decode(str).map((x) => MemberBasicModel.fromJson(x)));

String memberBasicModelsToJson(List<MemberBasicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
