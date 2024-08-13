import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/menu_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/menu_repository.dart';

import '../../../routes/app_routes.dart';
import '../../../util/app_export.dart';

class MenuScreenController extends GetxController {
  RxList<MenuModel> menus = RxList.empty();
  RxString currentSortCriteria = 'Sort Ascending'.obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchMenuScreenData();
    super.onInit();
  }

  Future<void> refreshData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    await fetchMenuScreenData();
    isLoading.value = false;
    update();
  }

  Future<void> fetchMenuScreenData() async {
    isLoading.value = true;

    await getAllMenu();
    sortItems("Sort Newest");

    isLoading.value = false;
  }

  getAllMenu() async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.getAllMenu();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      menus.value = menuModelsFromJson(response.body);
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

  void sortItems(String? newValue) {
    currentSortCriteria.value = newValue!;
    switch (currentSortCriteria.value) {
      case 'Sort Ascending':
        menus.sort((a, b) => a.menuName!.compareTo(b.menuName!));
        break;
      case 'Sort Descending':
        menus.sort((a, b) => b.menuName!.compareTo(a.menuName!));
        break;
      case 'Sort Newest':
        menus.sort((a, b) => b.menuID!.compareTo(a.menuID!));
        break;
      case 'Sort Oldest':
        menus.sort((a, b) => a.menuID!.compareTo(b.menuID!));
        break;
    }
  }
}
