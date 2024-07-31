import 'dart:async';
import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/screens/plan/model/plan_model.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';
import '../config/jwt_interceptor.dart';

class PlanRepository {
  static Future<http.Response> getPlanByAdvisor() async {
    var response = await interceptedClient.get(
      BuildServer.buildUrl("plans/getByAdvisor"),
      headers: {
        "Content-type": "application/json",
      },
    ).timeout(const Duration(seconds: 30));
    return response;
  }

  // static Future<http.Response> createNewPlan(PlanModel createPlan) async {
  //   Map<String, String> header = {
  //     "Content-type": "application/json",
  //   };
  //   var response = await interceptedClient
  //       .post(BuildServer.buildUrl('plans/createNew'), headers: header)
  //       .timeout(const Duration(seconds: 30));
  //   return response;
  // }

  static Future<http.Response> createNewPlan(PlanModel createPlan) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.post(
        BuildServer.buildUrl("plans/createNew"),
        headers: header,
        body: json.encode(createPlan.toJson()));
    return response;
  }

  static Future<http.Response> updatePlan() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .put(BuildServer.buildUrl('plans/update'), headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> deactivatePlan() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .delete(BuildServer.buildUrl('plans/deactivate/123'), headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
