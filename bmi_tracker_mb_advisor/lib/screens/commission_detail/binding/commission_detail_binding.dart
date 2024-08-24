import 'package:bmi_tracker_mb_advisor/screens/commission_detail/controller/commission_detail_controller.dart';

import '../../../util/app_export.dart';

class CommissionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommissionDetailsController());
  }
}
