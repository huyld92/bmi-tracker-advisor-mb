import 'dart:convert';

class WorkoutExerciseRequest {
  int? exerciseID;
  int? duration;

  WorkoutExerciseRequest({
    this.exerciseID,
    this.duration,
  });

  factory WorkoutExerciseRequest.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseRequest(
      exerciseID: json['exerciseID'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseID': exerciseID,
      'duration': duration,
    };
  }
}

class CreateWorkoutModel {
  String? workoutName;
  String? workoutDescription;
  int? standardWeight;
  List<WorkoutExerciseRequest>? workoutExerciseRequests;

  CreateWorkoutModel({
    this.workoutName,
    this.workoutDescription,
    this.standardWeight,
    this.workoutExerciseRequests,
  });

  factory CreateWorkoutModel.fromJson(Map<String, dynamic> json) {
    return CreateWorkoutModel(
      workoutName: json['workoutName'],
      workoutDescription: json['workoutDescription'],
      standardWeight: json['standardWeight'],
      workoutExerciseRequests: json['workoutExerciseRequests'] != null
          ? List<WorkoutExerciseRequest>.from(json['workoutExerciseRequests']
          .map((x) => WorkoutExerciseRequest.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutName': workoutName,
      'workoutDescription': workoutDescription,
      'standardWeight': standardWeight,
      'workoutExerciseRequests': workoutExerciseRequests != null
          ? List<dynamic>.from(
          workoutExerciseRequests!.map((x) => x.toJson()))
          : null,
    };
  }
}

CreateWorkoutModel createWorkoutModelFromJson(String str) =>
    CreateWorkoutModel.fromJson(json.decode(str));

String createWorkoutModelToJson(CreateWorkoutModel data) =>
    json.encode(data.toJson());
