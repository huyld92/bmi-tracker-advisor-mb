import 'package:bmi_tracker_mb_advisor/screens/notification/controller/notification_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
