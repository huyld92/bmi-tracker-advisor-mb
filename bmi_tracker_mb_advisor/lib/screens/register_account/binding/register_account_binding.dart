import 'package:bmi_tracker_mb_advisor/screens/register_account/controller/register_account_controller.dart';

import '../../../util/app_export.dart';

class RegisterAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterAccountController());
  }
}
