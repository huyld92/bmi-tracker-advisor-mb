import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class StatisticsWeightController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchStatisticsWeightData();
    super.onInit();
  }

  void fetchStatisticsWeightData() {
    isLoading.value =true;
    isLoading.value =false;
  }
}
