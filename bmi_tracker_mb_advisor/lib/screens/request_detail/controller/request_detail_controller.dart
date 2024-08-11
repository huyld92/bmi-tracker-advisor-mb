import 'package:bmi_tracker_mb_advisor/models/request_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class RequestDetailsController extends GetxController {
  var isLoading = true.obs;
  Rx<RequestModel> requestModel = RequestModel().obs;

  @override
  Future<void> onInit() async {
    requestModel.value = Get.arguments;

    print('SubscriptionModel:${requestModel.toString()}');
    // TODO: implement onInit
    super.onInit();
  }
}
