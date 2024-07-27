import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/controller/add_exercise_to_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class AddExerciseToWorkoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddExerciseToWorkoutController());
  }
}
