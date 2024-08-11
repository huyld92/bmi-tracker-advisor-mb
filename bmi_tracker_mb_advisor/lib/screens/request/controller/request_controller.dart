import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/request_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/request_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../routes/app_routes.dart';

class RequestController extends GetxController {
  RxList<RequestModel> requestModel = RxList.empty();

  var isLoading = false.obs;

  @override
  void onInit() async {
    await fetchDataRequestScreen();
    isLoading.value = false;
    super.onInit();
  }

  void goToRequestDetail(int index) {
    Get.toNamed(AppRoutes.requestDetailScreen, arguments: requestModel[index]);
  }

  fetchDataRequestScreen() async {
    isLoading.value = true;
    await fetchRequest();
    isLoading.value = false;
  }

  Future<void> fetchRequest() async {
    var response = await RequestRepository.fetchRequest();
    if (response.statusCode == 200) {
      // convert list foods from json
      requestModel.value = requestModelFromJson(response.body);
      requestModel.sort(
        (a, b) => b.userRequestId!.compareTo(a.userRequestId!),
      );
      requestModel.refresh();
    } else if (response.statusCode == 204) {
      requestModel.clear();
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

  void goToCreateRequest() {
    Get.toNamed(AppRoutes.createRequestScreen);
  }
}
