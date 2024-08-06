import 'dart:convert';

class MenuDetailsModel {
  int? menuID;
  String? menuName;
  String? menuPhoto;
  String? menuDescription;
  int? totalCalories;
  bool? isActive;
  List<MenuFoodModel>? menuFoods;

  MenuDetailsModel({
    this.menuID,
    this.menuName,
    this.menuPhoto,
    this.menuDescription,
    this.totalCalories,
    this.isActive,
    this.menuFoods,
  });

  factory MenuDetailsModel.fromJson(Map<String, dynamic> json) {
    return MenuDetailsModel(
      menuID: json['menuID'],
      menuName: json['menuName'],
      menuPhoto: json['menuPhoto'],
      menuDescription: json['menuDescription'],
      totalCalories: json['totalCalories'],
      isActive: json['isActive'],
      menuFoods: json['menuFoods'] != null
          ? List<MenuFoodModel>.from(
              json['menuFoods'].map((x) => MenuFoodModel.fromJson(x)))
          : List.empty(),
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
      'menuFoods': menuFoods != null
          ? List<dynamic>.from(menuFoods!.map((x) => x.toJson()))
          : null,
    };
  }

  static List<MenuDetailsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MenuDetailsModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<MenuDetailsModel> menus) {
    return menus.map((menu) => menu.toJson()).toList();
  }
}

class MenuFoodModel {
  int? menuFoodID;
  int? foodID;
  String? foodName;
  int? foodCalories;
  String? description;
  String? foodPhoto;
  String? foodVideo;
  double? carbs;
  double? protein;
  double? fat;
  int? foodTimeProcess;
  int? serving;
  String? mealType;

  MenuFoodModel({
    this.menuFoodID,
    this.foodID,
    this.foodName,
    this.foodCalories,
    this.description,
    this.foodPhoto,
    this.foodVideo,
    this.carbs,
    this.protein,
    this.fat,
    this.foodTimeProcess,
    this.serving,
    this.mealType,
  });

  factory MenuFoodModel.fromJson(Map<String, dynamic> json) {
    return MenuFoodModel(
      menuFoodID: json['menuFoodID'],
      foodID: json['foodID'],
      foodName: json['foodName'],
      foodCalories: json['foodCalories'],
      description: json['description'],
      foodPhoto: json['foodPhoto'],
      foodVideo: json['foodVideo'],
      carbs: json['carbs'] ?? 0,
      protein: json['protein'] ?? 0,
      fat: json['fat'] ?? 0,
      foodTimeProcess: json['foodTimeProcess'],
      serving: json['serving'],
      mealType: json['mealType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuFoodID': menuFoodID,
      'foodID': foodID,
      'foodName': foodName,
      'foodCalories': foodCalories,
      'description': description,
      'foodPhoto': foodPhoto,
      'foodVideo': foodVideo,
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
      'foodTimeProcess': foodTimeProcess,
      'serving': serving,
      'mealType': mealType,
    };
  }

  static List<MenuFoodModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MenuFoodModel.fromJson(json)).toList();
  }
}

List<MenuDetailsModel> menuFromJson(String str) {
  final jsonData = json.decode(str);
  return MenuDetailsModel.fromJsonList(jsonData);
}

String menuToJson(List<MenuDetailsModel> data) {
  final jsonData = MenuDetailsModel.toJsonList(data);
  return json.encode(jsonData);
}
