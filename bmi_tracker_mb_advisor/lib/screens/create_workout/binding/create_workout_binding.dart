import 'package:bmi_tracker_mb_advisor/screens/create_workout/controller/create_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class CreateWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateWorkoutController());
  }
}
