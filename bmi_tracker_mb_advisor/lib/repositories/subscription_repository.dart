import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/build_server.dart';
import '../config/jwt_interceptor.dart';

class SubscriptionsRepository {
  static Future<http.Response> getAllSubscriptionByAdvisor() async {
    var response = await interceptedClient.get(
      BuildServer.buildUrl("subscriptions/advisor/getAll"),
      headers: {
        "Content-type": "application/json",
      },
    ).timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> getCurrentMember() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl('subscriptions/advisor/getCurrentMember'),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
