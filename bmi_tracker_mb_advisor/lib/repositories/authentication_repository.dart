
import 'dart:async';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class AuthenticationRepository {
  static Future<http.Response> postLogin(var body) async {
    http.Response response;

    Map<String, String> header = {
      "Content-type": "application/json",
    };
    response = await interceptedClient.post(
      BuildServer.buildUrl("auth/login"),
      body: body,
      headers: header,
    );
    return response;
  }

  static Future<String> logout() async {
    try {
      Map<String, String> header = {
        "Content-type": "application/json",
      };
      var response = await interceptedClient
          .post(
        BuildServer.buildUrl("auth/logout"),
        headers: header,
      )
          .timeout(const Duration(seconds: 30));
      return response.body;
    } on TimeoutException catch (e) {
      return e.toString();
    }
  }
}
