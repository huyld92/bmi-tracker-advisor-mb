import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/member_repository.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/member_information_model.dart';

class MemberDetailsController extends GetxController {
  Rx<MemberInformationModel> member = MemberInformationModel().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchMemberDetailsData();
    super.onInit();
  }

  Future<void> fetchMemberDetailsData() async {
    isLoading.value = true;
    int memberID = Get.arguments;
    await getMemberInformation(memberID);
    isLoading.value = false;
  }

  getMemberInformation(int memberID) async {
    // gọi API lấy danh sách menu của advisor
    var response = await MemberRepository.getMemberInformation(memberID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      member.value = memberFromJson(response.body);
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

  void chat() {}

  void goToWeightStatistics() {
    Get.toNamed(AppRoutes.statisticsWeightScreen,
        arguments: member.value.memberID);
  }

  void goToCaloriesStatistics() {
    Get.toNamed(AppRoutes.statisticsCaloriesScreen,
        arguments: member.value.memberID);
  }

  void goToMenu() {}

  void goToWorkout() {}
}
