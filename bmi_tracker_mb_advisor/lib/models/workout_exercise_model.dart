class WorkoutExerciseModel {
  int? workoutExerciseID;
  int? exerciseID;
  String? exerciseName;
  String? exercisePhoto;
  String? exerciseVideo;
  int? met;
  String? exerciseDescription;
  int? tagID;
  String? tagName;
  int? duration;
  int? caloriesBurned;
  bool? isActive;

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
    this.isActive,
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
      isActive: json['isActive'],
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
      'isActive': isActive,
    };
  }
}
