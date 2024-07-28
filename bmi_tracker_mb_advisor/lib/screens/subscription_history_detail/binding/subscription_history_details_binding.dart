import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../controller/subscription_history_details_controller.dart';

class SubscriptionHistoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionHistoryDetailsController());
  }
}
