import 'package:bmi_tracker_mb_advisor/screens/update_workout/controller/update_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class UpdateWorkoutBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateWorkoutController());
  }

}