import 'package:bmi_tracker_mb_advisor/screens/change_password/controller/change_password_controller.dart';

import '../../../util/app_export.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
