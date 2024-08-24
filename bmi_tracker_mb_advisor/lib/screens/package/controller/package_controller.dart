import 'dart:convert';
import 'dart:math';

import 'package:bmi_tracker_mb_advisor/repositories/package_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../routes/app_routes.dart';
import '../model/package_model.dart';

class PackageController extends GetxController {
  RxList<PackageModel> packageModel = RxList.empty();

  var isLoading = false.obs;

  @override
  void onInit() async {
    await fetchDataPackageScreen();
    super.onInit();
  }

  void goToPackageDetail(int index) {
    Get.toNamed(AppRoutes.packageDetailsScreen, arguments: packageModel[index]);
  }

  fetchDataPackageScreen() async {
    isLoading.value = true;
    await fetchPackage();
    isLoading.value = false;
  }

  Future<void> fetchPackage() async {
    var response = await PackageRepository.getPackageByAdvisor();
    if (response.statusCode == 200) {
      // convert list foods from json
      packageModel.value = packageModelFromJson(response.body);
      packageModel.sort(
        (a, b) => b.packageId!.compareTo(a.packageId!),
      );
      packageModel.refresh();
    } else if (response.statusCode == 204) {
      packageModel.clear();
      print('list empty');
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          json.decode(response.body)['message']);
    }
  }

  void goToCreatePackage() {
    Get.toNamed(AppRoutes.createPackageScreen);
  }
}
