import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../controller/create_workout_controller.dart';

class CreateWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateWorkoutController());
  }
}
