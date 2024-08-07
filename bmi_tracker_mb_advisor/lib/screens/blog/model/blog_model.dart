// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

List<BlogModel> blogModelFromJson(String str) =>
    List<BlogModel>.from(json.decode(str).map((x) => BlogModel.fromJson(x)));

String blogModelToJson(List<BlogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogModel {
  int? blogId;
  String? blogName;
  String? blogContent;
  String? blogPhoto;
  String? link;
  int? advisorId;
  bool? isActive;

  BlogModel({
    this.blogId,
    this.blogName,
    this.blogContent,
    this.blogPhoto,
    this.link,
    this.advisorId,
    this.isActive,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        blogId: json["blogID"],
        blogName: json["blogName"],
        blogContent: json["blogContent"],
        blogPhoto: json["blogPhoto"],
        link: json["link"],
        advisorId: json["advisorID"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "blogID": blogId,
        "blogName": blogName,
        "blogContent": blogContent,
        "blogPhoto": blogPhoto,
        "link": link,
        "advisorID": advisorId,
        "isActive": isActive,
      };

  Map<String, dynamic> toUpdateJson() => {
        "blogID": blogId,
        "blogName": blogName,
        "blogContent": blogContent,
        "blogPhoto": blogPhoto,
        "link": link,
      };
}
