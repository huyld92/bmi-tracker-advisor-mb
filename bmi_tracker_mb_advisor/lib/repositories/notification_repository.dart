import 'dart:async';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class NotificationRepository {
  static Future<http.Response> getAllNotification() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl("notifications/get-all-for-user"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> markAsRead(int? notificationID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .put(
            BuildServer.buildUrl(
                "notifications/mark-as-read?notificationID=$notificationID"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> readAll() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .put(
            BuildServer.buildUrl(
                "notifications/read-all"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
