import 'package:bmi_tracker_mb_advisor/screens/create_package/controller/create_package_controller.dart';

import '../../../util/app_export.dart';

class CreatePackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePackageController());
  }
}
