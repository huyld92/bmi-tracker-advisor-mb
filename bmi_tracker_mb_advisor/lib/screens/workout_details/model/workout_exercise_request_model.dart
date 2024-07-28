class WorkoutExerciseRequestModel {
  int? workoutID;
  int? exerciseID;
  int? duration;

  WorkoutExerciseRequestModel({
    this.workoutID,
    this.exerciseID,
    this.duration,
  });

  factory WorkoutExerciseRequestModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseRequestModel(
      workoutID: json['workoutID'],
      exerciseID: json['exerciseID'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutID': workoutID,
      'exerciseID': exerciseID,
      'duration': duration,
    };
  }
}
