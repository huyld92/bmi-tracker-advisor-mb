import 'dart:async';
import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/screens/blog/model/blog_model.dart';

import '../config/build_server.dart';
import 'package:http/http.dart' as http;

import '../config/jwt_interceptor.dart';

class BlogRepository {
  static Future<http.Response> getAllBlog() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl('blogs/advisor/getAll'), headers: header)
        .timeout(const Duration(seconds: 30));

    return response;
  }

  // static createBlog(http.Response) async {
  //   Map<String, String> header = {
  //     "Content-type": "application/json",
  //   };
  //   var response = await interceptedClient
  //       .post(BuildServer.buildUrl('blogs/createNew'), headers: header)
  //       .timeout(const Duration(seconds: 30));

  //   return response;
  // }

  static Future<http.Response> createBlog(BlogModel blogModel) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.post(
        BuildServer.buildUrl("blogs/createNew"),
        headers: header,
        body: json.encode(blogModel.toJson()));
    return response;
  }
}
