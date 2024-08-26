import 'dart:convert';

import '../util/date_time_utils.dart';

class AccountModel {
  int? accountID;
  String? email;
  String? fullName;
  String? accountPhoto;
  String? phoneNumber;
  String? gender;
  String? bankName;
  String? bankNumber;
  DateTime? birthday;
  List<String>? roleNames;
  bool? isActive;

  AccountModel({
    this.accountID,
    this.email,
    this.fullName,
    this.accountPhoto,
    this.phoneNumber,
    this.gender,
    this.bankName,
    this.bankNumber,
    this.birthday,
    this.roleNames,
    this.isActive,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    String date = json['birthday'] ?? "1998-05-01";

    return AccountModel(
      accountID: json['accountID'],
      email: json['email'],
      fullName: json['fullName'],
      accountPhoto: json['accountPhoto'] ??
          "https://res.cloudinary.com/dlipvbdwi/image/upload/v1700192116/avatar_snfpmg.jpg",
      phoneNumber: json['phoneNumber'],
      gender: json['gender'] ?? "Male",
      bankName: json['bankName'] ?? "",
      bankNumber: json['bankNumber'] ?? "",
      birthday: DateTimeExtension.parseWithFormat(date, format: "yyyy-MM-dd"),
      roleNames: List<String>.from(json['roleNames']),
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountID': accountID,
      'email': email,
      'fullName': fullName,
      'accountPhoto': accountPhoto,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'bankName': bankName,
      'bankNumber': bankNumber,
      'birthday': birthday,
      'roleNames': roleNames,
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return 'AccountModel{accountID: $accountID, email: $email, fullName: $fullName, accountPhoto: $accountPhoto, phoneNumber: $phoneNumber, gender: $gender, bankName: $bankName, bankNumber: $bankNumber, birthday: $birthday, roleNames: $roleNames, isActive: $isActive}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModel &&
          runtimeType == other.runtimeType &&
          accountID == other.accountID &&
          email == other.email;

  @override
  int get hashCode => accountID.hashCode ^ email.hashCode;

  static List<AccountModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AccountModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<AccountModel> accounts) {
    return accounts.map((account) => account.toJson()).toList();
  }
}

List<AccountModel> accountFromJson(String str) {
  final jsonData = json.decode(str);
  return AccountModel.fromJsonList(jsonData);
}

String accountToJson(List<AccountModel> data) {
  final jsonData = AccountModel.toJsonList(data);
  return json.encode(jsonData);
}
