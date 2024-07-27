import 'dart:async';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class StatisticsRepository {
  static Future<http.Response> getStatisticCalories(
      int memberID, String date) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(
            BuildServer.buildUrl(
                "statistics/dialy-record/week-by-date?memberID=$memberID&date=$date"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> getStatisticWeight(
      int memberID, String date) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(
            BuildServer.buildUrl(
                "statistics/member-bodymass/getInMonth?memberID=$memberID&date=$date"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
