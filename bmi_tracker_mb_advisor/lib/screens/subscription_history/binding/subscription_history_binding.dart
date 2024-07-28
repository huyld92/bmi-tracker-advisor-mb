import 'package:get/get.dart';

import '../controller/subscription_history_controller.dart';

class SubscriptionHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionHistoryController());
  }
}
