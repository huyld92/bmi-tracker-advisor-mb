import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/build_server.dart';
import '../config/jwt_interceptor.dart';

class CommisionRepository {
  static Future<http.Response> getAllCommisionByAdvisor() async {
    var response = await interceptedClient.get(
      BuildServer.buildUrl("commissions/advisor/getAll"),
      headers: {
        "Content-type": "application/json",
      },
    ).timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> getAllCommissionDetails(int commissionId) async {
    var response = await interceptedClient
        .get(
          BuildServer.buildUrl(
              "commissions/get-details?commissionID=$commissionId"),
        )
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
