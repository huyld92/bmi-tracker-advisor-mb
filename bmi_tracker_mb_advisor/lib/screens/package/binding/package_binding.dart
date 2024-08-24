import 'package:bmi_tracker_mb_advisor/screens/package/controller/package_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class PackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PackageController());
  }
}
