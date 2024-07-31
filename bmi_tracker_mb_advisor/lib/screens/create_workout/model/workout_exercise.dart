import 'dart:convert';

class WorkoutExercise {
  int? exerciseID;
  String? exerciseName;
  double? met;
  String? emoji;
  int? duration;
  int? caloriesBurned;

  WorkoutExercise({
    this.exerciseID,
    this.exerciseName,
    this.met,
    this.emoji,
    this.duration,
    this.caloriesBurned,
  });
}
