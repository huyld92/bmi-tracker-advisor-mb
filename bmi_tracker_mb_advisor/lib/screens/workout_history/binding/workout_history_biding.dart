import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../controller/workout_history_controller.dart';

class WorkoutHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkoutHistoryController());
  }
}
