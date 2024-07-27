import 'dart:async';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class MealLogRepository {
  static Future<http.Response> getMealLogByDate(
      String date, int memberID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(
            BuildServer.buildUrl(
                "meallog/member/get-by-date?date=$date&memberID=$memberID}"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
