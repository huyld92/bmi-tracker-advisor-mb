import 'dart:async';
import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/create_menu_model.dart';
import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class MenuRepository {
  static Future<http.Response> getAllMenu() async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl("menus/getMenuByAdvisor"), headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> getMenuByMenuID(int menuID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .get(BuildServer.buildUrl("menus/getMenuByID?menuID=$menuID"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static createNewMenu(CreateMenuModel createMenuModel) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response =
        await interceptedClient.post(BuildServer.buildUrl("menus/createNew"),
            headers: {
              "Content-type": "application/json",
            },
            body: json.encode(createMenuModel.toJson()));
    return response;
  }

  static deactivateMenu(int? menuID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .delete(BuildServer.buildUrl("menus/deactivate/$menuID"), headers: {
      "Content-type": "application/json",
    });

    return response;
  }

  static activateMenu(int? menuID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient
        .put(BuildServer.buildUrl("menus/activate/$menuID"), headers: {
      "Content-type": "application/json",
    });

    return response;
  }
}
