import 'package:bmi_tracker_mb_advisor/screens/meal_logs/controller/meal_logs_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class MealLogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MealLogsController());
  }
}
