import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../controller/package_details_controller.dart';

class PackageDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PackageDetailsController());
  }
}
