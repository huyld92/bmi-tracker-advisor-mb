import 'dart:convert';

class MenuHistoryModel {
  int? menuHistoryID;
  DateTime? dateOfAssigned;
  int? menuID;
  String? menuPhoto;
  int? totalCalories;
  String? menuDescription;
  String? menuName;
  int? memberID;
  String? fullName;
  bool? isActive;

  MenuHistoryModel({
    this.menuHistoryID,
    this.dateOfAssigned,
    this.menuID,
    this.menuPhoto,
    this.totalCalories,
    this.menuDescription,
    this.menuName,
    this.memberID,
    this.fullName,
    this.isActive,
  });

  factory MenuHistoryModel.fromJson(Map<String, dynamic> json) {
    return MenuHistoryModel(
      menuHistoryID: json['menuHistoryID'],
      dateOfAssigned: DateTime.parse(json['dateOfAssigned']),
      menuID: json['menuID'],
      menuPhoto: json['menuPhoto'],
      totalCalories: json['totalCalories'],
      menuDescription: json['menuDescription'],
      menuName: json['menuName'],
      memberID: json['memberID'],
      fullName: json['fullName'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuHistoryID': menuHistoryID,
      'dateOfAssigned': dateOfAssigned,
      'menuID': menuID,
      'menuPhoto': menuPhoto,
      'totalCalories': totalCalories,
      'menuDescription': menuDescription,
      'menuName': menuName,
      'memberID': memberID,
      'fullName': fullName,
      'isActive': isActive,
    };
  }
}

List<MenuHistoryModel> menuHistoryModelsFromJson(String str) =>
    List<MenuHistoryModel>.from(
        json.decode(str).map((x) => MenuHistoryModel.fromJson(x)));

String menuHistoryModelsToJson(List<MenuHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
