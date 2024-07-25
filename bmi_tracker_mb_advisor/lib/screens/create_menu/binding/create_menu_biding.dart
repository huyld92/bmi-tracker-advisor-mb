import 'package:bmi_tracker_mb_advisor/screens/create_menu/controller/create_menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class CreateMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateMenuController());
  }
}
