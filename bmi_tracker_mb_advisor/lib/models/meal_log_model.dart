import 'dart:convert';

class MealLogModel {
  int? mealLogID;
  String? foodName;
  int? calories;
  String? mealType;
  double? quantity;
  String? unit;
  int? recordID;
  int? foodID;

  MealLogModel({
    this.mealLogID,
    this.foodName,
    this.calories,
    this.mealType,
    this.quantity,
    this.unit,
    this.recordID,
    this.foodID,
  });

  factory MealLogModel.fromJson(Map<String, dynamic> json) {
    return MealLogModel(
      mealLogID: json['mealLogID'],
      foodName: json['foodName'],
      calories: json['calories'],
      mealType: json['mealType'],
      quantity: json['quantity'],
      unit: json['unit'],
      recordID: json['recordID'],
      foodID: json['foodID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealLogID': mealLogID,
      'foodName': foodName,
      'calories': calories,
      'mealType': mealType,
      'quantity': quantity,
      'unit': unit,
      'recordID': recordID,
      'foodID': foodID,
    };
  }

  static List<MealLogModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MealLogModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<MealLogModel> mealLogs) {
    return mealLogs.map((mealLog) => mealLog.toJson()).toList();
  }
}

List<MealLogModel> mealLogsFromJson(String str) {
  final jsonData = json.decode(str);
  return MealLogModel.fromJsonList(jsonData);
}

String mealLogToJson(List<MealLogModel> data) {
  final jsonData = MealLogModel.toJsonList(data);
  return json.encode(jsonData);
}
