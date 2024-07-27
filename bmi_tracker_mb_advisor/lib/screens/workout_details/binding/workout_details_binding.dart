import 'package:bmi_tracker_mb_advisor/screens/workout_details/controller/workout_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class WorkoutDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkoutDetailsController());
  }
}
