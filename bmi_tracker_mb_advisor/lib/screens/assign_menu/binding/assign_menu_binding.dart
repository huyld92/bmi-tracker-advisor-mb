import 'package:bmi_tracker_mb_advisor/screens/assign_menu/controller/assign_menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class AssignMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssignMenuController());
  }
}
