import 'dart:convert';

List<MenuFoodModel> menuFoodModelsFromJson(String str) =>
    List<MenuFoodModel>.from(
        jsonDecode(str).map((x) => MenuFoodModel.fromJson(x)));

String menuFoodModelToJson(List<MenuFoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuFoodModel {
  int? menuID;
  String? menuName;
  String? menuPhoto;
  String? menuDescription;
  int? totalCalories;
  bool? isActive;
  int? advisorID;
  List<MenuFood>? menuFoods;

  MenuFoodModel({
    this.menuID,
    this.menuName,
    this.menuPhoto,
    this.menuDescription,
    this.totalCalories,
    this.isActive,
    this.advisorID,
    this.menuFoods,
  });

  factory MenuFoodModel.fromJson(Map<String, dynamic> json) {
    return MenuFoodModel(
      menuID: json['menuID'],
      menuName: json['menuName'],
      menuPhoto: json['menuPhoto'],
      menuDescription: json['menuDescription'],
      totalCalories: json['totalCalories'],
      isActive: json['isActive'],
      advisorID: json['advisorID'],
      menuFoods: json['menuFoods'] != null
          ? List<MenuFood>.from(
              json['menuFoods'].map((x) => MenuFood.fromJson(x)))
          : [],
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
      'menuFoods': menuFoods != null
          ? List<dynamic>.from(menuFoods!.map((x) => x.toJson()))
          : [],
    };
  }
}

class MenuFood {
  Food? food;
  String? mealType;
  bool? isActive;

  MenuFood({
    this.food,
    this.mealType,
    this.isActive,
  });

  factory MenuFood.fromJson(Map<String, dynamic> json) {
    return MenuFood(
      food: json['food'] != null ? Food.fromJson(json['food']) : null,
      mealType: json['mealType'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food?.toJson(),
      'mealType': mealType,
      'isActive': isActive,
    };
  }
}

class Food {
  int? foodID;
  String? foodName;
  int? foodCalories;
  String? description;
  String? foodPhoto;
  String? foodVideo;
  String? foodNutrition;
  int? foodTimeProcess;
  String? serving;
  String? creationDate;
  bool? isActive;

  Food({
    this.foodID,
    this.foodName,
    this.foodCalories,
    this.description,
    this.foodPhoto,
    this.foodVideo,
    this.foodNutrition,
    this.foodTimeProcess,
    this.serving,
    this.creationDate,
    this.isActive,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodID: json['foodID'],
      foodName: json['foodName'],
      foodCalories: json['foodCalories'],
      description: json['description'],
      foodPhoto: json['foodPhoto'],
      foodVideo: json['foodVideo'],
      foodNutrition: json['foodNutrition'],
      foodTimeProcess: json['foodTimeProcess'],
      serving: json['serving'],
      creationDate: json['creationDate'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodID': foodID,
      'foodName': foodName,
      'foodCalories': foodCalories,
      'description': description,
      'foodPhoto': foodPhoto,
      'foodVideo': foodVideo,
      'foodNutrition': foodNutrition,
      'foodTimeProcess': foodTimeProcess,
      'serving': serving,
      'creationDate': creationDate,
      'isActive': isActive,
    };
  }
}
