import 'package:bmi_tracker_mb_advisor/screens/statistics_weight/controller/statistics_weight_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class StatisticsWeightBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatisticsWeightController());
  }
}
