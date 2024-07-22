// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

List<MenuModel> menuModelFromJson(String str) =>
    List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  final int? menuId;
  final String? menuName;
  final String? menuPhoto;
  final String? menuDescription;
  final int? totalCalories;
  final bool? isActive;
  final int? advisorId;
  final String? advisorName;

  MenuModel({
    this.menuId,
    this.menuName,
    this.menuPhoto,
    this.menuDescription,
    this.totalCalories,
    this.isActive,
    this.advisorId,
    this.advisorName,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        menuId: json["menuID"],
        menuName: json["menuName"],
        menuPhoto: json["menuPhoto"],
        menuDescription: json["menuDescription"],
        totalCalories: json["totalCalories"],
        isActive: json["isActive"],
        advisorId: json["advisorID"],
        advisorName: json["advisorName"],
      );

  Map<String, dynamic> toJson() => {
        "menuID": menuId,
        "menuName": menuName,
        "menuPhoto": menuPhoto,
        "menuDescription": menuDescription,
        "totalCalories": totalCalories,
        "isActive": isActive,
        "advisorID": advisorId,
        "advisorName": advisorName,
      };
  @override
  String toString() {
    return 'MenuModel(menuId: $menuId, menuName: $menuName, menuDescription: $menuDescription, menuPhoto: $menuPhoto,isActive: $isActive, advisorID: $advisorId, advisorName: $advisorName)';
  }
}
