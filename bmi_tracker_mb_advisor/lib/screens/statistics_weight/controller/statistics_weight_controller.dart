import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/%20statistics_bodymass_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../repositories/statistics_repository.dart';

class StatisticsWeightController extends GetxController {
  RxList<StatisticsMemberBodyMassModel> statisticsBodyMassModels =
      RxList.empty();

  RxString goalWeight = "0".obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchStatisticsWeightData();
    super.onInit();
  }

  Future<void> fetchStatisticsWeightData() async {
    isLoading.value = true;
    var arguments = Get.arguments;
    int memberID = arguments[0];
    goalWeight.value = arguments[1].toString();
    DateTime date = DateTime.parse(DateTime.now().format());
    // DateTime date = DateTime.now();

    await getStatisticBodyMass(memberID, date.format());
    isLoading.value = false;
  }

  Future<void> getStatisticBodyMass(int memberID, String date) async {
    // gọi API deactivate workout
    var response =
        await StatisticsRepository.getStatisticBodyMass(memberID, date);
    // kiểm tra kết quả
    print('response:${response.statusCode}');
    if (response.statusCode == 200) {
      statisticsBodyMassModels.value =
          statisticsMemberBodyMassFromJson(response.body);
      statisticsBodyMassModels.sort(
        (a, b) => a.dateInput!.compareTo(b.dateInput!),
      );
    } else if (response.statusCode == 204) {
      statisticsBodyMassModels.clear();
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
