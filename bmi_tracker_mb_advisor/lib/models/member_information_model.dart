import 'dart:convert';

class MemberInformationModel {
  int? memberID;
  String? email;
  String? accountPhoto;
  String? fullName;
  String? gender;
  String? phoneNumber;
  DateTime? endDateOfPlan;
  DateTime? birthday;
  int? height;
  int? weight;
  int? age;
  double? bmi;
  double? bmr;
  double? tdee;

  MemberInformationModel({
    this.memberID,
    this.email,
    this.accountPhoto,
    this.fullName,
    this.gender,
    this.phoneNumber,
    this.endDateOfPlan,
    this.birthday,
    this.height,
    this.weight,
    this.age,
    this.bmi,
    this.bmr,
    this.tdee,
  });

  factory MemberInformationModel.fromJson(Map<String, dynamic> json) {
    return MemberInformationModel(
      memberID: json['memberID'],
      email: json['email'],
      accountPhoto: json['accountPhoto'],
      fullName: json['fullName'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      endDateOfPlan: json['endDateOfPlan'] != null
          ? DateTime.parse(json['endDateOfPlan'])
          : null,
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      height: json['height'],
      weight: json['weight'],
      age: json['age'],
      bmi: (json['bmi'] != null) ? json['bmi'].toDouble() : null,
      bmr: (json['bmr'] != null) ? json['bmr'].toDouble() : null,
      tdee: (json['tdee'] != null) ? json['tdee'].toDouble() : null,
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
      'endDateOfPlan': endDateOfPlan?.toIso8601String(),
      'birthday': birthday?.toIso8601String(),
      'height': height,
      'weight': weight,
      'age': age,
      'bmi': bmi,
      'bmr': bmr,
      'tdee': tdee,
    };
  }
}

MemberInformationModel memberFromJson(String str) =>
    MemberInformationModel.fromJson(json.decode(str));

String memberToJson(MemberInformationModel data) => json.encode(data.toJson());
