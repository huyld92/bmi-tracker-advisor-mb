import 'package:bmi_tracker_mb_advisor/screens/plan/model/plan_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class PlanDetailsController extends GetxController {
  var isLoading = true.obs;
  Rx<PlanModel> planModel = PlanModel().obs;

  @override
  Future<void> onInit() async {
    planModel.value = Get.arguments;

    print('PlanModel:${planModel.toString()}');
    // TODO: implement onInit
    super.onInit();
  }
}
