import 'package:bmi_tracker_mb_advisor/screens/plan/model/package_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class PackageDetailsController extends GetxController {
  var isLoading = true.obs;
  Rx<PackageModel> packageModel = PackageModel().obs;

  @override
  Future<void> onInit() async {
    packageModel.value = Get.arguments;

    print('PlanModel:${packageModel.toString()}');
    // TODO: implement onInit
    super.onInit();
  }
}
