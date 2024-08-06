import 'package:bmi_tracker_mb_advisor/models/recipe_model.dart';

import 'food_tag_model.dart';

class FoodDetailsModel {
  int? foodID;
  String? foodName;
  int? foodCalories;
  String? description;
  String? foodPhoto;
  String? foodVideo;
  int? foodTimeProcess;
  String? creationDate;
  double? carbs;
  double? protein;
  double? fat;
  int? serving;
  bool? isActive;
  List<FoodTag>? foodTags;
  List<Recipe>? recipes;

  FoodDetailsModel({
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
    this.creationDate,
    this.serving,
    this.isActive,
    this.foodTags,
    this.recipes,
  });

  factory FoodDetailsModel.fromJson(Map<String, dynamic> json) {
    return FoodDetailsModel(
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
      creationDate: json['creationDate'],
      serving: json['serving'],
      isActive: json['isActive'],
      foodTags: json['foodTags'] != null
          ? List<FoodTag>.from(json['foodTags'].map((x) => FoodTag.fromJson(x)))
          : List.empty(),
      recipes: json['recipes'] != null
          ? List<Recipe>.from(json['recipes'].map((x) => Recipe.fromJson(x)))
          : List.empty(),
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
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
      'foodTimeProcess': foodTimeProcess,
      'creationDate': creationDate,
      'serving': serving,
      'isActive': isActive,
      'foodTags': foodTags?.map((i) => i.toJson()).toList(),
      'recipes': recipes?.map((i) => i.toJson()).toList(),
    };
  }
}
