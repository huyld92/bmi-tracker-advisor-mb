import 'dart:convert';

class WorkoutExercise {
  int? exerciseID;
  String? exerciseName;
  String? emoji;
  int? duration;
  int? caloriesBurned;

  WorkoutExercise({
    this.exerciseID,
    this.exerciseName,
    this.emoji,
    this.duration,
    this.caloriesBurned,
  });
}
