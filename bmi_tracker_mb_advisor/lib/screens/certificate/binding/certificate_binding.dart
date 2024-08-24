import 'package:bmi_tracker_mb_advisor/screens/certificate/controller/certificate_controller.dart';

import '../../../util/app_export.dart';

class CertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CertificateController());
  }
}
