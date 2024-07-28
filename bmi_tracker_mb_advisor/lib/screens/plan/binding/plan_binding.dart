import 'package:bmi_tracker_mb_advisor/screens/plan/controller/plan_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class PlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanController());
  }
}
