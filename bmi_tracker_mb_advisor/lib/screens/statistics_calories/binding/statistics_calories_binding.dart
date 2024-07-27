import 'package:bmi_tracker_mb_advisor/screens/statistics_calories/controller/statistics_calories_controller.dart';
import 'package:get/get.dart';

class StatisticsCaloriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatisticsCaloriesController());
  }
}
