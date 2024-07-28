import 'package:bmi_tracker_mb_advisor/screens/profile/controller/profile_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
