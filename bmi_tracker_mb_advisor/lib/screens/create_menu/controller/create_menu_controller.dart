import 'package:bmi_tracker_mb_advisor/models/enums/EMealType.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/create_menu_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/menu_food_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../util/app_export.dart';

class CreateMenuController extends GetxController {
  TextEditingController menuNameController = TextEditingController();
  TextEditingController menuDescriptionController = TextEditingController();

  RxList<MenuFoodModel> menuFoodModels = RxList.empty();

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

  void createNewMenu() {
    CreateMenuModel createMenuModel = CreateMenuModel(
      menuPhoto: "",
      menuName: menuNameController.text,
      menuDescription: menuDescriptionController.text,
      // menuFoods: menuFoodModels,
    );
  }
}
