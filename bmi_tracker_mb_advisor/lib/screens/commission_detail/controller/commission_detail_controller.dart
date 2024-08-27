import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/commission_allocation_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/commission/model/commission_model.dart';

import '../../../repositories/commission_repository.dart';
import '../../../util/app_export.dart';

class CommissionDetailsController extends GetxController {
  var isLoading = true.obs;
  Rx<CommisionModel> commissionModel = CommisionModel().obs;
  RxList<CommissionAllocationModel> commissionAllocations = RxList.empty();

  @override
  Future<void> onInit() async {
    fetchDataCommissionDetailsScreen();

    super.onInit();
  }

  Future<void> fetchDataCommissionDetailsScreen() async {
    isLoading.value = true;
    commissionModel.value = Get.arguments;
    await getCommissionAllocation(commissionModel.value.commissionId!);
    isLoading.value = false;
  }

  getCommissionAllocation(int commissionId) async {
    // gọi API
    var response =
        await CommisionRepository.getAllCommissionDetails(commissionId);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      String jsonResult = utf8.decode(response.bodyBytes);
      commissionAllocations.value =
          commissionAllocationModelsFromJson(jsonResult);
    } else if (response.statusCode == 204) {
      commissionAllocations.clear();
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }
  }
}
