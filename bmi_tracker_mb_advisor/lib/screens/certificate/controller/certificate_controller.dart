import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/certificate_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/certificate_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../routes/app_routes.dart';

class CertificateController extends GetxController {
  RxList<CertificateModel> certificateModel = RxList.empty();

  var isLoading = false.obs;

  @override
  void onInit() async {
    await fetchDataCertificateScreen();
    isLoading.value = false;
    super.onInit();
  }

  fetchDataCertificateScreen() async {
    isLoading.value = true;
    await fetchCertificate();
    isLoading.value = false;
  }

  Future<void> fetchCertificate() async {
    var response = await CertificateRepository.getCertificateByAdvisor();
    if (response.statusCode == 200) {
      // convert list foods from json
      certificateModel.value = certificateModelFromJson(response.body);
      certificateModel.sort(
        (a, b) => b.certificateId!.compareTo(a.certificateId!),
      );
      certificateModel.refresh();
    } else if (response.statusCode == 204) {
      certificateModel.clear();
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

  void goToCreateCertificate() {
    Get.toNamed(AppRoutes.createCertificateScreen);
  }
}
