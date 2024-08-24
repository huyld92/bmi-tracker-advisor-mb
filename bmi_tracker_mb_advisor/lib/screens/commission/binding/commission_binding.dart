import 'package:bmi_tracker_mb_advisor/screens/commission/controller/commission_controller.dart';

import '../../../util/app_export.dart';

class CommisionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommisionController());
  }
}
