import 'dart:convert';

class ActivityLogModel {
  int? activityLogID;
  String? activityName;
  int? caloriesBurned;
  String? emoji;
  int? duration;
  int? recordID;
  int? exerciseID;

  ActivityLogModel({
    this.activityLogID,
    this.activityName,
    this.caloriesBurned,
    this.emoji,
    this.duration,
    this.recordID,
    this.exerciseID,
  });

  factory ActivityLogModel.fromJson(Map<String, dynamic> json) {
    return ActivityLogModel(
      activityLogID: json['activityLogID'],
      activityName: json['activityName'],
      caloriesBurned: json['caloriesBurned'],
      emoji: json['emoji'],
      duration: json['duration'],
      recordID: json['recordID'],
      exerciseID: json['exerciseID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activityLogID': activityLogID,
      'activityName': activityName,
      'caloriesBurned': caloriesBurned,
      'emoji': emoji,
      'duration': duration,
      'recordID': recordID,
      'exerciseID': exerciseID,
    };
  }

  static List<ActivityLogModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ActivityLogModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<ActivityLogModel> activityLogs) {
    return activityLogs.map((activityLog) => activityLog.toJson()).toList();
  }
}

List<ActivityLogModel> activityLogsFromJson(String str) {
  final jsonData = json.decode(str);
  return ActivityLogModel.fromJsonList(jsonData);
}

String activityLogToJson(List<ActivityLogModel> data) {
  final jsonData = ActivityLogModel.toJsonList(data);
  return json.encode(jsonData);
}
