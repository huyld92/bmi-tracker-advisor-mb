import 'dart:async';
import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/config/jwt_interceptor.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/create_menu_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu_details/model/create_menu_food_request.dart';
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
        .get(BuildServer.buildUrl("menus/get-details?menuID=$menuID"),
            headers: header)
        .timeout(const Duration(seconds: 30));
    return response;
  }

  static Future<http.Response> createNewMenu(
      CreateMenuModel createMenuModel) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.post(
        BuildServer.buildUrl("menus/createNew"),
        headers: header,
        body: json.encode(createMenuModel.toJson()));
    return response;
  }

  static Future<http.Response> deactivateMenu(int? menuID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.delete(
      BuildServer.buildUrl("menus/deactivate/$menuID"),
      headers: header,
    );

    return response;
  }

  static Future<http.Response> activateMenu(int? menuID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.put(
      BuildServer.buildUrl("menus/activate/$menuID"),
      headers: header,
    );

    return response;
  }

  static Future<http.Response> deactivateMenuFood(int menuFoodID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.delete(
      BuildServer.buildUrl("menus/menu-food/deactivate?menuFoodID=$menuFoodID"),
      headers: header,
    );
    return response;
  }

  static Future<http.Response> activateMenuFood(int? menuFoodID) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.put(
      BuildServer.buildUrl("menus/menu-food/activate?menuFoodID=$menuFoodID"),
      headers: header,
    );

    return response;
  }

  static Future<http.Response> createNewMenuFoods(
      List<CreateMenuFoodRequest> createMenuFoodRequests) async {
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    var response = await interceptedClient.post(
      BuildServer.buildUrl("menus/create-menu-foods"),
      body: createMenuFoodRequestsToJson(createMenuFoodRequests),
      headers: header,
    );
    return response;
  }
}
