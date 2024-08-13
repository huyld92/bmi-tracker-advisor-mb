import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../package/model/package_model.dart';

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
