import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/meal_log_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/meal_log_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/src/material/date.dart';

class MealLogsController extends GetxController {
  RxList<MealLogModel> mealLogModels = RxList.empty();
  RxString date = "2024-05-31".obs;
  var isLoading = false.obs;
  int memberID = -1;

  @override
  void onInit() {
    fetchMealLogScreenData();
    super.onInit();
  }

  Future<void> fetchMealLogScreenData() async {
    isLoading.value = true;
    memberID = Get.arguments;

    await getMealLogByDateAndMemberID(date.value, memberID);
    isLoading.value = false;
  }

  getMealLogByDateAndMemberID(String date, int memberID) async {
    // gọi API lấy danh sách member của advisor
    var response = await MealLogRepository.getMealLogByDate(date, memberID);
    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      mealLogModels.value = mealLogsFromJson(response.body);
      mealLogModels.sort((a, b) => a.mealType!.compareTo(b.mealType!));
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      mealLogModels.clear();
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

  void onDatePicker(DateTime date) {
    isLoading.value = true;
    this.date.value = date.format();
    getMealLogByDateAndMemberID(date.format(), memberID);

    isLoading.value = false;
  }
}
