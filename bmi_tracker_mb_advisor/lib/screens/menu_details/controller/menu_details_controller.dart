import 'dart:convert';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/screens/menu_details/model/create_menu_food_request.dart';

import '../../../models/menu_details_model.dart';
import '../../../repositories/menu_repository.dart';
import '../../../util/app_export.dart';

class MenuDetailsController extends GetxController {
  Rx<MenuDetailsModel> menuDetailsModel = MenuDetailsModel().obs;

  var isLoading = false.obs;
  var isOwned = false.obs;

  @override
  void onInit() {
    fetchMenuDetailsScreen();
    super.onInit();
  }

  Future<void> fetchMenuDetailsScreen() async {
    isLoading.value = true;
    var arguments = Get.arguments;

    int menuID = arguments[0];
    isOwned.value = arguments[1];

    await getMenuDetails(menuID);

    isLoading.value = false;
  }

  getMenuDetails(int menuID) async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.getMenuByMenuID(menuID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      menuDetailsModel.value =
          MenuDetailsModel.fromJson(jsonDecode(response.body));
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

  createMenuFoods(List<CreateMenuFoodRequest> createMenuFoodRequests) async {
    isLoading.value = true;
    // gọi API lấy danh sách menu của advisor
    var response =
        await MenuRepository.createNewMenuFoods(createMenuFoodRequests);
    // kiểm tra kết quả
    if (response.statusCode == 201) {
      // Parse the JSON string
      List<dynamic> jsonList = jsonDecode(response.body);

      // Convert each JSON item to a MenuFoodModel object
      List<MenuFoodModel> menuFoodModels =
          jsonList.map((json) => MenuFoodModel.fromJson(json)).toList();

      menuDetailsModel.value.menuFoods?.addAll(menuFoodModels);
      menuDetailsModel.refresh();
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

  deactivateMenuFood(int menuFoodID) async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.deactivateMenuFood(menuFoodID);

    // kiểm tra kết quả
    if (response.statusCode == 204) {
      Get.snackbar('Deactivate food', 'Deactivate food success!');
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

  activateMenuFood(int menuFoodID) async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.activateMenuFood(menuFoodID);

    // kiểm tra kết quả
    if (response.statusCode == 204) {
      Get.snackbar('Activate food', 'Activate food success!');
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

  void deactivateFood(int index) {
    menuDetailsModel.value.menuFoods![index].isActive = false;
    int menuFoodID = menuDetailsModel.value.menuFoods![index].menuFoodID!;
    deactivateMenuFood(menuFoodID);
    menuDetailsModel.refresh();
  }

  void activateFood(int index) {
    menuDetailsModel.value.menuFoods![index].isActive = true;
    int menuFoodID = menuDetailsModel.value.menuFoods![index].menuFoodID!;
    activateMenuFood(menuFoodID);
    menuDetailsModel.refresh();
  }

  void goToAddFood() {
    Get.toNamed(AppRoutes.addFoodToMenuScreen,
            arguments: menuDetailsModel.value.menuID)
        ?.then((value) async {
      if (value != null) {
        List<CreateMenuFoodRequest> createMenuFoodRequests = value;
        await createMenuFoods(createMenuFoodRequests);
      }
    });
  }

  void goToFoodDetails(int? foodID) {
    Get.toNamed(AppRoutes.foodDetailsScreen, arguments: foodID!);
  }
}
