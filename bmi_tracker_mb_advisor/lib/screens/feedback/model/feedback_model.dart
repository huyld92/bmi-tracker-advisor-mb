// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) =>
    FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

String registFeedbackToJson(FeedbackModel data) {
  return json.encode(data.registFeedbackToJson());
}

class FeedbackModel {
  String? feedbackId;
  String? title;
  String? description;
  String? status;
  String? type;
  String? memberID;
  // MemberModel? members;

  FeedbackModel({
    this.feedbackId,
    this.title,
    this.description,
    this.status,
    this.type,
    this.memberID,
    // this.members,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        feedbackId: json["feedbackId"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        type: json["type"],
        memberID: json["memberID"],
        // members: json["members"] == null ? null : MemberModel.fromJson(json["members"]),
      );

  Map<String, dynamic> toJson() => {
        "feedbackId": feedbackId,
        "title": title,
        "description": description,
        "status": status,
        "type": type,
        "memberID": memberID,
        // "members": members?.toJson(),
      };

  Map<String, dynamic> registFeedbackToJson() => {
        "title": title,
        "description": description,
        "type": type,
        "memberID": memberID,
      };
}
