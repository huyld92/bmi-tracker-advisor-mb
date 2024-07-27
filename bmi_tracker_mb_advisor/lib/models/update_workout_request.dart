import 'dart:convert';

class WorkoutRequestModel {
  int? workoutID;
  String? workoutName;
  String? workoutDescription;
  int? standardWeight;

  WorkoutRequestModel({
    this.workoutID,
    this.workoutName,
    this.workoutDescription,
    this.standardWeight,
  });

  factory WorkoutRequestModel.fromJson(Map<String, dynamic> json) {
    return WorkoutRequestModel(
      workoutID: json['workoutID'],
      workoutName: json['workoutName'],
      workoutDescription: json['workoutDescription'],
      standardWeight: json['standardWeight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutID': workoutID,
      'workoutName': workoutName,
      'workoutDescription': workoutDescription,
      'standardWeight': standardWeight,
    };
  }

  static List<WorkoutRequestModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkoutRequestModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<WorkoutRequestModel> records) {
    return records.map((record) => record.toJson()).toList();
  }
}

List<WorkoutRequestModel> workoutRequestFromJson(String str) {
  final jsonData = json.decode(str);
  return WorkoutRequestModel.fromJsonList(jsonData);
}

String workoutRequestToJson(List<WorkoutRequestModel> data) {
  final jsonData = WorkoutRequestModel.toJsonList(data);
  return json.encode(jsonData);
}
