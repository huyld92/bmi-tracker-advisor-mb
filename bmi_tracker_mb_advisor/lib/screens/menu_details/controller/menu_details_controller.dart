import 'dart:convert';

import '../../../models/menu_food_model.dart';
import '../../../repositories/menu_repository.dart';
import '../../../util/app_export.dart';

class MenuDetailsController extends GetxController {
  Rx<MenuFoodModel> menuFoodModel = MenuFoodModel().obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchMenuDetailsScreen();
    super.onInit();
  }

  Future<void> fetchMenuDetailsScreen() async {
    isLoading.value = true;
    // int menuID = Get.arguments;
    int menuID = 1;
    // await Future.delayed(Duration(seconds: 5));
    await getMenuDetails(menuID);

    isLoading.value = false;
  }

  getMenuDetails(int menuID) async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.getMenuByMenuID(menuID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      menuFoodModel.value = MenuFoodModel.fromJson(jsonDecode(response.body));
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
