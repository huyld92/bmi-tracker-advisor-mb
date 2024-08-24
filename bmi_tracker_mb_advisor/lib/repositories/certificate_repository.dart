import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/certificate_model.dart';

import '../config/build_server.dart';
import '../config/jwt_interceptor.dart';
import 'package:http/http.dart' as http;

class CertificateRepository {
  static Future<http.Response> getCertificateByAdvisor() async {
    var response = await interceptedClient.get(
      BuildServer.buildUrl("certificates/advisor/getAll"),
      headers: {
        "Content-type": "application/json",
      },
    ).timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> createNewCertificate(
      CertificateModel createCertificate) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.post(
        BuildServer.buildUrl("certificates/advisor/create-new"),
        headers: header,
        body: json.encode(createCertificate.toJson()));
    return response;
  }

  static Future<http.Response> deleteCertificate() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .delete(BuildServer.buildUrl('certificates/delete?certificateID=12'),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }
}
