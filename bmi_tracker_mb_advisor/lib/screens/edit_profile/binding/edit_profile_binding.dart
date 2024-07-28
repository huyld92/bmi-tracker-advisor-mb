import 'package:bmi_tracker_mb_advisor/screens/edit_profile/controller/edit_profile_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
