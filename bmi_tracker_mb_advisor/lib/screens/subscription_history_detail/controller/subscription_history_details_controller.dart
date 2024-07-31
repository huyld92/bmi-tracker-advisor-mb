import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../subscription_history/model/subscription_model.dart';

class SubscriptionHistoryDetailsController extends GetxController {
  var isLoading = true.obs;
  Rx<SubscriptionModel> subscriptionModel = SubscriptionModel().obs;

  @override
  Future<void> onInit() async {
    subscriptionModel.value = Get.arguments;

    print('SubscriptionModel:${subscriptionModel.toString()}');
    // TODO: implement onInit
    super.onInit();
  }
}
