import 'package:bmi_tracker_mb_advisor/screens/menu/controller/menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout/controller/workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/workspace/controller/workspace_controller.dart';
import 'package:get/get.dart';

class WorkspaceBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => WorkspaceController());
    Get.lazyPut(() => WorkoutController());
    Get.lazyPut(() => MenuScreenController());
  }

}