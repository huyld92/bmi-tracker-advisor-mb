import 'package:bmi_tracker_mb_advisor/screens/create_plan/controller/create_plan_controller.dart';

import '../../../util/app_export.dart';

class CreatePlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePlanController());
  }
}
