import 'dart:async';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class NotificationRepository {
  static Future<http.Response> getAllMenu() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl("notifications/get-all-for-user"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
