import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/menu_history_model.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../repositories/menu_history_repository.dart';

class MenuHistoryController extends GetxController {
  RxList<MenuHistoryModel> menuHistoryModels = RxList.empty();
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchDataMenuHistoryScreen();
    super.onInit();
  }

  Future<void> fetchDataMenuHistoryScreen() async {
    isLoading.value = true;
    int memberID = Get.arguments!;
    await getMenuHistoryOfMember(memberID);
    isLoading.value = false;
  }

  getMenuHistoryOfMember(int memberID) async {
    // gọi API lấy danh sách menu history của advisor
    var response = await MenuHistoryRepository.getMenuHistoryOfMember(memberID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list menu history from json
      menuHistoryModels.value = menuHistoryModelsFromJson(response.body);
      menuHistoryModels
          .sort((a, b) => b.dateOfAssigned!.compareTo(a.dateOfAssigned!));
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      menuHistoryModels.clear();
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
        arguments: [menuHistoryModels[index].menuID, false]);
  }

  void assignNewMenu() {}
}
