import 'dart:convert';

class WorkoutHistoryModel {
  int? workoutHistoryID;
  DateTime? dateOfAssigned;
  int? workoutID;
  String? workoutName;
  String? workoutDescription;
  int? standardWeight;
  int? totalCaloriesBurned;
  int? memberID;
  String? fullName;
  bool? isActive;

  WorkoutHistoryModel({
    this.workoutHistoryID,
    this.dateOfAssigned,
    this.workoutID,
    this.workoutName,
    this.workoutDescription,
    this.standardWeight,
    this.totalCaloriesBurned,
    this.memberID,
    this.fullName,
    this.isActive,
  });

  factory WorkoutHistoryModel.fromJson(Map<String, dynamic> json) {
    return WorkoutHistoryModel(
      workoutHistoryID: json['workoutHistoryID'],
      dateOfAssigned: DateTime.parse(json['dateOfAssigned']),
      workoutID: json['workoutID'],
      workoutName: json['workoutName'],
      workoutDescription: json['workoutDescription'],
      standardWeight: json['standardWeight'],
      totalCaloriesBurned: json['totalCaloriesBurned'],
      memberID: json['memberID'],
      fullName: json['fullName'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutHistoryID': workoutHistoryID,
      'dateOfAssigned': dateOfAssigned,
      'workoutID': workoutID,
      'workoutName': workoutName,
      'workoutDescription': workoutDescription,
      'standardWeight': standardWeight,
      'totalCaloriesBurned': totalCaloriesBurned,
      'memberID': memberID,
      'fullName': fullName,
      'isActive': isActive,
    };
  }
}

List<WorkoutHistoryModel> workoutHistoryModelsFromJson(String str) =>
    List<WorkoutHistoryModel>.from(
        json.decode(str).map((x) => WorkoutHistoryModel.fromJson(x)));

String workoutHistoryModelsToJson(List<WorkoutHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
