import 'package:bmi_tracker_mb_advisor/screens/update_menu/controller/update_menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class UpdateMenuBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateMenuController());
  }

}