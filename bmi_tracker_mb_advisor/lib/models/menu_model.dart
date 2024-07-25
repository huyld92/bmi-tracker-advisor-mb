import 'dart:convert';

class MenuModel {
  int? menuID;
  String? menuName;
  String? menuPhoto;
  String? menuDescription;
  int? totalCalories;
  bool? isActive;
  int? advisorID;
  String? advisorName;

  MenuModel({
    this.menuID,
    this.menuName,
    this.menuPhoto,
    this.menuDescription,
    this.totalCalories,
    this.isActive,
    this.advisorID,
    this.advisorName,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      menuID: json['menuID'],
      menuName: json['menuName'],
      menuPhoto: json['menuPhoto'],
      menuDescription: json['menuDescription'],
      totalCalories: json['totalCalories'],
      isActive: json['isActive'],
      advisorID: json['advisorID'],
      advisorName: json['advisorName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuID': menuID,
      'menuName': menuName,
      'menuPhoto': menuPhoto,
      'menuDescription': menuDescription,
      'totalCalories': totalCalories,
      'isActive': isActive,
      'advisorID': advisorID,
      'advisorName': advisorName,
    };
  }
}

List<MenuModel> menuModelsFromJson(String str) =>
    List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelsToJson(List<MenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
