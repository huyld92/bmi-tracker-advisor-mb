import 'package:bmi_tracker_mb_advisor/screens/menu/controller/menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuScreenController());
  }
}
