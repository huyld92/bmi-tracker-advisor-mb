import 'package:bmi_tracker_mb_advisor/screens/request_detail/controller/request_detail_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class RequestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestDetailsController());
  }
}
