import 'dart:convert';

class MemberInformationModel {
  int? accountID;
  int? memberID;
  String? email;
  String? accountPhoto;
  String? fullName;
  String? gender;
  String? phoneNumber;
  String? dietaryPreference;
  DateTime? endDateOfPlan;
  DateTime? birthday;
  int? height;
  int? weight;
  int? targetWeight;
  int? age;
  double? bmi;
  double? bmr;
  double? tdee;

  MemberInformationModel({
    this.accountID,
    this.memberID,
    this.email,
    this.accountPhoto,
    this.fullName,
    this.gender,
    this.phoneNumber,
    this.dietaryPreference,
    this.endDateOfPlan,
    this.birthday,
    this.height,
    this.weight,
    this.targetWeight,
    this.age,
    this.bmi,
    this.bmr,
    this.tdee,
  });

  factory MemberInformationModel.fromJson(Map<String, dynamic> json) {
    return MemberInformationModel(
      accountID: json['accountID'],
      memberID: json['memberID'],
      email: json['email'],
      accountPhoto: json['accountPhoto'],
      fullName: json['fullName'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      dietaryPreference: json['dietaryPreference'],
      endDateOfPlan: json['endDateOfPlan'] != null
          ? DateTime.parse(json['endDateOfPlan'])
          : null,
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      height: json['height'],
      weight: json['weight'],
      targetWeight: json['targetWeight'],
      age: json['age'],
      bmi: (json['bmi'] != null) ? json['bmi'].toDouble() : null,
      bmr: (json['bmr'] != null) ? json['bmr'].toDouble() : null,
      tdee: (json['tdee'] != null) ? json['tdee'].toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountID': accountID,
      'memberID': memberID,
      'email': email,
      'accountPhoto': accountPhoto,
      'fullName': fullName,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'dietaryPreference': dietaryPreference,
      'endDateOfPlan': endDateOfPlan?.toIso8601String(),
      'birthday': birthday?.toIso8601String(),
      'height': height,
      'weight': weight,
      'targetWeight': targetWeight,
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
