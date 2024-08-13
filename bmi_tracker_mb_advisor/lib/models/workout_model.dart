import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/workout_exercise_model.dart';

class WorkoutModel {
  int? workoutID;
  String? workoutName;
  String? workoutDescription;
  int? totalCaloriesBurned;
  int? standardWeight;
  bool? isActive;
  int? advisorID;
  String? fullName;
  List<WorkoutExerciseModel>? workoutExercises;
  List<String>? membersUsing;

  WorkoutModel({
    this.workoutID,
    this.workoutName,
    this.workoutDescription,
    this.totalCaloriesBurned,
    this.standardWeight,
    this.isActive,
    this.advisorID,
    this.fullName,
    this.workoutExercises,
    this.membersUsing,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      workoutID: json['workoutID'],
      workoutName: json['workoutName'],
      workoutDescription: json['workoutDescription'],
      totalCaloriesBurned: json['totalCaloriesBurned'],
      standardWeight: json['standardWeight'] ?? 0,
      isActive: json['isActive'],
      advisorID: json['advisorID'],
      fullName: json['fullName'],
      workoutExercises: json['workoutExercises'] != null
          ? List<WorkoutExerciseModel>.from(json['workoutExercises']
              .map((x) => WorkoutExerciseModel.fromJson(x)))
          : List.empty(growable: true),
      membersUsing: json['membersUsing'] != null
          ? List<String>.from(json['membersUsing'])
          : List.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutID': workoutID,
      'workoutName': workoutName,
      'workoutDescription': workoutDescription,
      'totalCaloriesBurned': totalCaloriesBurned,
      'standardWeight': standardWeight,
      'isActive': isActive,
      'advisorID': advisorID,
      'fullName': fullName,
      'workoutExercises':
          workoutExercises?.map((exercise) => exercise.toJson()).toList(),
    };
  }
}

List<WorkoutModel> workoutModelsFromJson(String str) => List<WorkoutModel>.from(
    json.decode(str).map((x) => WorkoutModel.fromJson(x)));

String workoutModelsToJson(List<WorkoutModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
