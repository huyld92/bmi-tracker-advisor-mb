 import 'package:bmi_tracker_mb_advisor/screens/update_profile/controller/update_profile_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateProfileController());
  }
}
