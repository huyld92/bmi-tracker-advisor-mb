import 'package:bmi_tracker_mb_advisor/screens/commission/model/commission_model.dart';

import '../../../util/app_export.dart';

class CommissionDetailsController extends GetxController {
  var isLoading = true.obs;
  Rx<CommisionModel> commissionModels = CommisionModel().obs;

  @override
  Future<void> onInit() async {
    commissionModels.value = Get.arguments;

    print('CommisionModel:${commissionModels.toString()}');
    // TODO: implement onInit
    super.onInit();
  }
}
