import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/food_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/controller/create_menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/create_menu_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_menu/model/menu_food_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/enums/EMealType.dart';
import '../../../repositories/food_repository.dart';

class AddFoodToMenuController extends GetxController {
  var createMenuController = Get.find<CreateMenuController>();

  var selectedMeal = EMealType.Breakfast.obs;

  RxList<FoodModel> foodModels = RxList.empty();
  RxList<bool> foodSelected = RxList.empty();

  @override
  Future<void> onInit() async {
    await getAllFood();
    foodSelected = RxList.generate(foodModels.length, (index) => false);
    super.onInit();
  }

  void selectMeal(EMealType meal) {
    selectedMeal.value = meal;
  }

  getAllFood() async {
    // gọi API lấy danh sách menu của advisor
    var response = await FoodRepository.getAllFood();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      foodModels.value = foodModelsFromJson(response.body);
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      foodModels.clear();
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

  void onSelectFood(int index) {
    foodSelected[index] = !foodSelected[index];
  }

  void addFoodToMenu() {
    for (int i = 0; i < foodSelected.length; i++) {
      if (foodSelected[i]) {
        createMenuController.menuFoodModels.add(MenuFoodModel(
            foodName: foodModels[i].foodName,
            mealType: selectedMeal.value.name,
            foodID: foodModels[i].foodID,
            foodPhoto: foodModels[i].foodPhoto));
        createMenuController.createMenuFoodModels.add(CreateMenuFoodModel(
          foodID: foodModels[i].foodID,
          mealType: selectedMeal.value.name,
        ));
      }
    }
    Get.back();
  }

  void goToFoodDetails(int? foodID) {
    print('foodID:$foodID}');
  }
}
