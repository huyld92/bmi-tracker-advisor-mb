import 'package:bmi_tracker_mb_advisor/screens/activity_logs/controller/activity_logs_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class ActivityLogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityLogsController());
  }
}
