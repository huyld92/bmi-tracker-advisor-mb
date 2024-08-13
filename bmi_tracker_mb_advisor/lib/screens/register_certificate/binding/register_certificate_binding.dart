import 'package:bmi_tracker_mb_advisor/screens/register_certificate/controller/register_certificate_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class RegisterCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterCertificateController());
  }
}
