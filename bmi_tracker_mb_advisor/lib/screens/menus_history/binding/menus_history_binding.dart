import 'package:bmi_tracker_mb_advisor/screens/menus_history/controller/menus_history_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class MenuHistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MenuHistoryController());
  }

}