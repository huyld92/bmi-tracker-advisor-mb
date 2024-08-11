import 'package:bmi_tracker_mb_advisor/screens/request/controller/request_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class RequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestController());
  }
}
