import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/menu_model.dart';
import '../../../repositories/menu_repository.dart';

class AssignMenuController extends GetxController {
  var isLoading = false.obs;
  RxList<MenuModel> menus = RxList.empty();
  late int memberID;

  @override
  void onInit() {
    fetchDataAssignMenuScreen();
    super.onInit();
  }

  Future<void> fetchDataAssignMenuScreen() async {
    isLoading.value = true;
    memberID = Get.arguments;

    await getAvailableMenu();
    isLoading.value = false;
  }

  getAvailableMenu() async {
    // gọi API lấy danh sách menu của advisor
    var response = await MenuRepository.getAllMenuAvailable();

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

  Future<void> assignMenu(int index) async {
    // gọi API lấy danh sách menu của advisor
    int menuID = menus[index].menuID!;
    var response = await MenuRepository.assignMenu(memberID, menuID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      Get.back(result: true);
      Get.snackbar("Assign menu", "Assign menu success!");
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
}
