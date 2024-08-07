import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/menu_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/menu_repository.dart';

import '../../../routes/app_routes.dart';
import '../../../util/app_export.dart';

class MenuScreenController extends GetxController {
  RxList<MenuModel> menus = RxList.empty();

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchMenuScreenData();
    super.onInit();
  }

  Future<void> fetchMenuScreenData() async {
    isLoading.value = true;

    await getAllMenu();

    isLoading.value = false;
  }

  getAllMenu() async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.getAllMenu();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      menus.value = menuModelsFromJson(response.body);
      menus.sort((a, b) => b.menuID!.compareTo(a.menuID!));
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      menus.clear();
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

  void goToMenuDetails(int index) {
    Get.toNamed(AppRoutes.menuDetailsScreen,
        arguments: [menus[index].menuID, true]);
  }

  void goToCreateMenu() {
    Get.toNamed(AppRoutes.createMenuScreen);
  }

  Future<void> deactivateMenu(int index) async {
    // gọi API deactivate menu
    var response = await MenuRepository.deactivateMenu(menus[index].menuID);
    // kiểm tra kết quả
    if (response.statusCode == 204) {
      // 204 thành công cập nhật giá trị tại index
      menus[index].isActive = false;
      menus.refresh();
      // Get.snackbar("Deactivate menu", "Deactivate menu success!");
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

  void goToUpdateMenu(int index) {
    Get.toNamed(AppRoutes.updateMenuScreen, arguments: menus[index])
        ?.then((value) {
      if (value != null) {
        menus[index] = value;
        menus.refresh();
      }
    });
  }

  Future<void> activateMenu(int index) async {
    // gọi API deactivate menu
    var response = await MenuRepository.activateMenu(menus[index].menuID);
    // kiểm tra kết quả
    if (response.statusCode == 204) {
      // 204 thành công cập nhật giá trị tại index
      menus[index].isActive = true;
      menus.refresh();

      // Get.snackbar("Activate menu", "Activate menu success!");
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
