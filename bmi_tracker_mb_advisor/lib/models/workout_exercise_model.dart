class WorkoutExerciseModel {
  int? workoutExerciseID;
  int? exerciseID;
  String? exerciseName;
  String? exercisePhoto;
  String? exerciseVideo;
  double? met;
  String? exerciseDescription;
  int? tagID;
  String? tagName;
  int? duration;
  int? caloriesBurned;

  WorkoutExerciseModel({
    this.workoutExerciseID,
    this.exerciseID,
    this.exerciseName,
    this.exercisePhoto,
    this.exerciseVideo,
    this.met,
    this.exerciseDescription,
    this.tagID,
    this.tagName,
    this.duration,
    this.caloriesBurned,
  });

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseModel(
      workoutExerciseID: json['workoutExerciseID'],
      exerciseID: json['exerciseID'],
      exerciseName: json['exerciseName'],
      exercisePhoto: json['exercisePhoto'],
      exerciseVideo: json['exerciseVideo'],
      met: json['met'],
      exerciseDescription: json['exerciseDescription'],
      tagID: json['tagID'],
      tagName: json['tagName'],
      duration: json['duration'],
      caloriesBurned: json['caloriesBurned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutExerciseID': workoutExerciseID,
      'exerciseID': exerciseID,
      'exerciseName': exerciseName,
      'exercisePhoto': exercisePhoto,
      'exerciseVideo': exerciseVideo,
      'met': met,
      'exerciseDescription': exerciseDescription,
      'tagID': tagID,
      'tagName': tagName,
      'duration': duration,
      'caloriesBurned': caloriesBurned,
    };
  }
}
