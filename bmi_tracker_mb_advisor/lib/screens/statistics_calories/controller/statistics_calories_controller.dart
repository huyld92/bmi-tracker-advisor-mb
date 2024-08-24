import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/statistics_daily_record_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/statistics_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';

class StatisticsCaloriesController extends GetxController {
  RxInt goalCalories = 0.obs;
  RxString averageCaloriesIn = '0'.obs;
  RxString averageCaloriesOut = '0'.obs;
  var isLoading = false.obs;

  RxList<StatisticsDailyRecordModel> dailyRecordModels = RxList.empty();

  @override
  void onInit() {
    fetchStatisticsCaloriesData();

    super.onInit();
  }

  Future<void> fetchStatisticsCaloriesData() async {
    isLoading.value = true;
    int memberID = Get.arguments;
    // String date = DateTime.now().format();
    // DateTime date = DateTime.parse("2024-05-31");
    DateTime date = DateTime.now();
    await getStatisticCalories(memberID, date.format());
    // tính giá trị trung bình
    if (dailyRecordModels.isEmpty) {
      averageCaloriesIn.value = "0";
      averageCaloriesOut.value = "0";
    } else {
      averageCaloriesIn.value =
          calculateAverageCaloriesIn().formatWithThousandSeparator();
      averageCaloriesOut.value =
          calculateAverageCaloriesOut().formatWithThousandSeparator();
      goalCalories.value = dailyRecordModels[0].defaultCalories!;
    }

    isLoading.value = false;
  }

  Future<void> getStatisticCalories(int memberID, String date) async {
    // gọi API deactivate workout
    var response =
        await StatisticsRepository.getStatisticCalories(memberID, date);
    // kiểm tra kết quả
    print('response${response.body}');
    if (response.statusCode == 200) {
      dailyRecordModels.value = statisticsDailyRecordsFromJson(response.body);
      dailyRecordModels.sort((a, b) => a.date!.compareTo(b.date!),);
    } else if (response.statusCode == 204) {
      dailyRecordModels.clear();
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      // Get.snackbar("Error server ${response.statusCode}",
      //     jsonDecode(response.body)['message']);
    }
  }

  int calculateAverageCaloriesIn() {
    // Calculate the average of totalCaloriesIn
    int totalCaloriesInSum = 0;
    for (var record in dailyRecordModels) {
      totalCaloriesInSum += record.totalCaloriesIn!;
    }

    double averageCaloriesIn = totalCaloriesInSum / dailyRecordModels.length;
    return averageCaloriesIn.round();
  }

  int calculateAverageCaloriesOut() {
    // Calculate the average of totalCaloriesIn
    int totalCaloriesOutSum = 0;
    for (var record in dailyRecordModels) {
      totalCaloriesOutSum += record.totalCaloriesOut!;
    }

    double averageCaloriesOut = totalCaloriesOutSum / dailyRecordModels.length;
    return averageCaloriesOut.round();
  }

  int getWeekOfMonth(DateTime date) {
    // Đặt ngày về đầu tuần (thứ Hai)
    DateTime startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    // Đặt ngày về đầu tháng
    DateTime startOfMonth = DateTime(date.year, date.month, 1);
    // Tính số tuần
    int weekOfMonth =
        ((startOfWeek.difference(startOfMonth).inDays) / 7).ceil() + 1;
    return weekOfMonth;
  }
}
