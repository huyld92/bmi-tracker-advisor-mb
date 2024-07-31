// To parse this JSON data, do
//
//     final createBlogModel = createBlogModelFromJson(jsonString);

import 'dart:convert';

CreateBlogModel createBlogModelFromJson(String str) =>
    CreateBlogModel.fromJson(json.decode(str));

String createBlogModelToJson(CreateBlogModel data) =>
    json.encode(data.toJson());

class CreateBlogModel {
  String? blogName;
  String? blogContent;
  String? blogPhoto;
  String? link;

  CreateBlogModel({
    this.blogName,
    this.blogContent,
    this.blogPhoto,
    this.link,
  });

  factory CreateBlogModel.fromJson(Map<String, dynamic> json) =>
      CreateBlogModel(
        blogName: json["blogName"],
        blogContent: json["blogContent"],
        blogPhoto: json["blogPhoto"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "blogName": blogName,
        "blogContent": blogContent,
        "blogPhoto": blogPhoto,
        "link": link,
      };
}
