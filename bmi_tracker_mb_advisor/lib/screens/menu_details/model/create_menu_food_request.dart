import 'dart:convert';

class CreateMenuFoodRequest {
  int? menuID;
  int? foodID;
  String? mealType;

  CreateMenuFoodRequest({
    this.menuID,
    this.foodID,
    this.mealType,
  });

  factory CreateMenuFoodRequest.fromJson(Map<String, dynamic> json) {
    return CreateMenuFoodRequest(
      menuID: json['menuID'],
      foodID: json['foodID'],
      mealType: json['mealType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuID': menuID,
      'foodID': foodID,
      'mealType': mealType,
    };
  }
}
String createMenuFoodRequestsToJson(List<CreateMenuFoodRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
