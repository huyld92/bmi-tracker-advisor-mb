import 'dart:convert';

class WorkoutModel {
  int? workoutID;
  String? workoutName;
  String? workoutDescription;
  int? totalCaloriesBurned;
  bool? isActive;
  int? advisorID;
  String? fullName;

  WorkoutModel({
    this.workoutID,
    this.workoutName,
    this.workoutDescription,
    this.totalCaloriesBurned,
    this.isActive,
    this.advisorID,
    this.fullName,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      workoutID: json['workoutID'],
      workoutName: json['workoutName']??'',
      workoutDescription: json['workoutDescription'] ??'',
      totalCaloriesBurned: json['totalCaloriesBurned'] ?? 0,
      isActive: json['isActive'],
      advisorID: json['advisorID'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutID': workoutID,
      'workoutName': workoutName,
      'workoutDescription': workoutDescription,
      'totalCaloriesBurned': totalCaloriesBurned,
      'isActive': isActive,
      'advisorID': advisorID,
      'fullName': fullName,
    };
  }
}

List<WorkoutModel> workoutModelsFromJson(String str) =>
    List<WorkoutModel>.from(
        json.decode(str).map((x) => WorkoutModel.fromJson(x)));

String workoutModelsToJson(List<WorkoutModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
