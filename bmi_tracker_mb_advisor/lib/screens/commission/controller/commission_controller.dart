import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/commission_repository.dart';
import 'package:bmi_tracker_mb_advisor/screens/commission/model/commission_model.dart';

import '../../../routes/app_routes.dart';
import '../../../util/app_export.dart';

class CommisionController extends GetxController {
  // RxList<BookingModel> bookingModels = RxList.empty();
  RxList<CommisionModel> commissionModels = RxList.empty();

  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await fetchCommission();
    isLoading.value = false;
    super.onInit();
  }

  void goToCommissionDetails(int index) {
    Get.toNamed(AppRoutes.commissionDetailsScreen,
        arguments: commissionModels[index]);
  }

  Future<void> fetchCommission() async {
    var response = await CommisionRepository.getAllCommisionByAdvisor();
    if (response.statusCode == 200) {
      // convert list foods from json
      String jsonResult = utf8.decode(response.bodyBytes);

      commissionModels.value = commisionModelFromJson(jsonResult);
      commissionModels.sort(
          (a, b) => b.expectedPaymentDate!.compareTo(a.expectedPaymentDate!));
    } else if (response.statusCode == 204) {
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
}
