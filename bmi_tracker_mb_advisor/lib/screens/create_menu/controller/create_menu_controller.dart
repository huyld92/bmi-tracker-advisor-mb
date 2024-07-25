import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/enums/EMealType.dart';
import 'package:bmi_tracker_mb_advisor/repositories/menu_repository.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/create_menu_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/menu_food_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu/controller/menu_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../../util/app_export.dart';

class CreateMenuController extends GetxController {
  TextEditingController menuNameController = TextEditingController();
  TextEditingController menuDescriptionController = TextEditingController();

  RxList<MenuFoodModel> menuFoodModels = RxList.empty();
  RxList<CreateMenuFoodModel> createMenuFoodModels = RxList.empty();

  var isLoading = false.obs;

// List<Create>
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void goToAddFood() {
    Get.toNamed(AppRoutes.addFoodToMenuScreen);
  }

  void removeFood(int index) {
    menuFoodModels.removeAt(index);
  }

  Future<void> createNewMenu() async {
    isLoading.value = true;
    CreateMenuModel createMenuModel = CreateMenuModel(
      menuPhoto: "",
      menuName: menuNameController.text,
      menuDescription: menuDescriptionController.text,
      menuFoods: createMenuFoodModels,
    );

    if (createMenuModel.menuName == null) {
      return;
    } else if (createMenuModel.menuName!.isEmpty) {
      return;
    }
    // gọi API create new menu
    var response = await MenuRepository.createNewMenu(createMenuModel);

    // kiểm tra kết quả
    if (response.statusCode == 201) {
      // convert list exercises from json
      var menuController = Get.find<MenuScreenController>();
      await menuController.fetchMenuScreenData();
      Get.back();
      Get.snackbar("Create menu success!", "");
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }
    isLoading.value = false;
  }
}
