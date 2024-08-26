import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/activity_log_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/activity_log_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class ActivityLogsController extends GetxController {
  RxList<ActivityLogModel> activityLogModels = RxList.empty();
  RxString date = "2024-05-31".obs;
  int memberID = -1;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchActivityLogScreenData();
    super.onInit();
  }

  Future<void> fetchActivityLogScreenData() async {
    isLoading.value = true;
    memberID = Get.arguments;
    date.value = DateTime.now().format();

    await getActivityLogByDateAndMemberID(date.value, memberID);
    isLoading.value = false;
  }

  getActivityLogByDateAndMemberID(String date, int memberID) async {
    // gọi API lấy danh sách member của advisor
    var response =
        await ActivityLogRepository.getActivityLogByDate(date, memberID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      String jsonResult = utf8.decode(response.bodyBytes);

      activityLogModels.value = activityLogsFromJson(jsonResult);
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      activityLogModels.clear();
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

  void onDatePicker(DateTime picked) {
    isLoading.value = true;
    date.value = picked.format();
    getActivityLogByDateAndMemberID(picked.format(), memberID);

    isLoading.value = false;
  }
}
