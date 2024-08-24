import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/build_server.dart';
import '../config/jwt_interceptor.dart';
import '../screens/package/model/package_model.dart';

class PackageRepository {
  static Future<http.Response> getPackageByAdvisor() async {
    var response = await interceptedClient.get(
      BuildServer.buildUrl("packages/getByAdvisor"),
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

  static Future<http.Response> createNewPackage(
      PackageModel createPackage) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.post(
        BuildServer.buildUrl("packages/createNew"),
        headers: header,
        body: json.encode(createPackage.toJson()));
    return response;
  }

  static Future<http.Response> updatePackage() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .put(BuildServer.buildUrl('packages/update'), headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> deactivatePlan() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .delete(BuildServer.buildUrl('packages/deactivate/2222'),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
