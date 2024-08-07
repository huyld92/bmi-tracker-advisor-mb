import 'dart:convert';
import 'dart:math';

import 'package:bmi_tracker_mb_advisor/repositories/plan_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../routes/app_routes.dart';
import '../model/plan_model.dart';

class PlanController extends GetxController {
  RxList<PlanModel> planModel = RxList.empty();

  var isLoading = false.obs;

  @override
  void onInit() async {
    await fetchDataPlanScreen();
    isLoading.value = false;
    super.onInit();
  }

  void goToPlanDetail(int index) {
    Get.toNamed(AppRoutes.planDetailsScreen, arguments: planModel[index]);
  }

  fetchDataPlanScreen() async {
    isLoading.value = true;
    await fetchPlan();
    isLoading.value = false;
  }

  Future<void> fetchPlan() async {
    var response = await PlanRepository.getPlanByAdvisor();
    if (response.statusCode == 200) {
      // convert list foods from json
      planModel.value = planModelFromJson(response.body);
      planModel.sort(
        (a, b) => b.planId!.compareTo(a.planId!),
      );
      planModel.refresh();
    } else if (response.statusCode == 204) {
      planModel.clear();
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

  void goToCreatePlan() {
    Get.toNamed(AppRoutes.createPlanScreen);
  }
}
