import 'package:bmi_tracker_mb_advisor/screens/member_details/controller/member_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class MemberDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberDetailsController());
  }
}
