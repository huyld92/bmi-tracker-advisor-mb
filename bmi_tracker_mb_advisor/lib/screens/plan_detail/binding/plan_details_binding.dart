import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../controller/plan_details_controller.dart';

class PlanDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanDetailsController());
  }
}
