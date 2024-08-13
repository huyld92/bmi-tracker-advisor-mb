import 'package:bmi_tracker_mb_advisor/screens/create_certificate/controller/create_certificate_controller.dart';

import '../../../util/app_export.dart';

class CreateCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCertificateController());
  }
}
