import 'package:bmi_tracker_mb_advisor/screens/assign_workout/controller/assign_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class AssignWorkoutBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AssignWorkoutController());
  }
}
