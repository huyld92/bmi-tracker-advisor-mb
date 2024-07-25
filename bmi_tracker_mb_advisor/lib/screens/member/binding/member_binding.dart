import 'package:bmi_tracker_mb_advisor/screens/member/controller/member_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class MemberBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MemberController());
  }

}