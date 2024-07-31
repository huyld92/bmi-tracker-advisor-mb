import 'dart:async';
import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class WorkoutHistoryRepository {
  static Future<http.Response> getAllWorkoutHistory(int memberID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(
          BuildServer.buildUrl("workout-history/member/getByID?memberID=$memberID"),
          headers: header,
        )
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
