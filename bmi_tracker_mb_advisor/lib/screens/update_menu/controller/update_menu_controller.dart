import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/menu_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/menu_repository.dart';
import 'package:bmi_tracker_mb_advisor/screens/update_menu/model/update_menu_request.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/cupertino.dart';

class UpdateMenuController extends GetxController {
  late MenuModel menu;
  late TextEditingController txtMenuNameController;
  late TextEditingController txtMenuDescriptionController;

  @override
  void onInit() {
    fetchUpdateMenuScreenData();
    super.onInit();
  }

  void fetchUpdateMenuScreenData() {
    menu = Get.arguments;

    txtMenuNameController = TextEditingController(text: menu.menuName);
    txtMenuDescriptionController =
        TextEditingController(text: menu.menuDescription);
  }

  Future<void> updateMenuInformation() async {
    menu.menuName = txtMenuNameController.text;
    menu.menuDescription = txtMenuDescriptionController.text;
    UpdateMenuRequest updateMenuRequest = UpdateMenuRequest(
      menuID: menu.menuID,
      menuName: menu.menuName,
      menuDescription: menu.menuDescription,
    );
    // gọi API deactivate menu
    var response = await MenuRepository.updateMenu(updateMenuRequest);
    // kiểm tra kết quả
    if (response.statusCode == 200) {
      Get.back(result: menu);
      Get.snackbar("Update menu", "Update menu success!");
    } else if (response.statusCode == 400) {
      Get.snackbar("Update menu", "Update menu failed!");
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }
  }
}
