import 'dart:async';

import '../config/build_server.dart';
import '../config/jwt_interceptor.dart';

class FeedbackRepository {
  static Future<String> registerFeedback(var body, String endpoint) async {
    try {
      var response = await interceptedClient.post(
        BuildServer.buildUrl(endpoint),
        body: body,
        headers: {"Content-type": "application/json"},
      ).timeout(const Duration(seconds: 30));
      return response.body;
    } on TimeoutException catch (e) {
      return e.toString();
    }
  }
}
