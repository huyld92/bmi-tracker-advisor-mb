import 'dart:convert';

class CreateMenuModel {
  String? menuName;
  String? menuPhoto;
  String? menuDescription;
  List<MenuFoodRequestModel>? menuFoods;

  CreateMenuModel({
    this.menuName,
    this.menuPhoto,
    this.menuDescription,
    this.menuFoods,
  });

  factory CreateMenuModel.fromJson(Map<String, dynamic> json) {
    return CreateMenuModel(
      menuName: json['menuName'],
      menuPhoto: json['menuPhoto'],
      menuDescription: json['menuDescription'],
      menuFoods: json['menuFoods'] != null
          ? List<MenuFoodRequestModel>.from(
          json['menuFoods'].map((x) => MenuFoodRequestModel.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuName': menuName,
      'menuPhoto': menuPhoto,
      'menuDescription': menuDescription,
      'menuFoods': menuFoods != null
          ? List<dynamic>.from(menuFoods!.map((x) => x.toJson()))
          : null,
    };
  }
}

class MenuFoodRequestModel {
  int? foodID;
  String? mealType;

  MenuFoodRequestModel({
    this.foodID,
    this.mealType,
  });

  factory MenuFoodRequestModel.fromJson(Map<String, dynamic> json) {
    return MenuFoodRequestModel(
      foodID: json['foodID'],
      mealType: json['mealType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodID': foodID,
      'mealType': mealType,
    };
  }
}

List<CreateMenuModel> menuModelsFromJson(String str) =>
    List<CreateMenuModel>.from(json.decode(str).map((x) => CreateMenuModel.fromJson(x)));

String menuModelsToJson(List<CreateMenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<MenuFoodRequestModel> menuFoodModelsFromJson(String str) =>
    List<MenuFoodRequestModel>.from(json.decode(str).map((x) => MenuFoodRequestModel.fromJson(x)));

String menuFoodModelsToJson(List<MenuFoodRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));