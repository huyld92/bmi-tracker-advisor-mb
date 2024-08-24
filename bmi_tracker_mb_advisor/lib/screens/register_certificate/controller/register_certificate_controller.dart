import 'dart:convert';
import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/models/certificate_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/certificate_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../../repositories/account_repository.dart';
import '../../../routes/app_routes.dart';

class RegisterCertificateController extends GetxController {
  final GlobalKey<FormState> registCertiFormKey = GlobalKey<FormState>();
  late TextEditingController certificateNameController;
  late TextEditingController certificateLinkController;
  var errorString = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    certificateNameController = TextEditingController();
    certificateLinkController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    certificateNameController.dispose();
    certificateLinkController.dispose();
    super.onClose();
  }

  String? validateCertificateName(String value) {
    if (value.isEmpty) {
      return "Field is required";
    }
    return null;
  }

  String? validateCertificateLink(String value) {
    if (value.isEmpty) {
      return "Field is required";
    }
    return null;
  }

  Future<void> logout() async {
    // Alert.showLoadingIndicatorDialog(context);
    PrefUtils.clearPreferencesData();
    await AccountRepository.logout();
    // await CometChat.logout(
    //   onSuccess: (message) {},
    //   onError: (excep) {},
    // );
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  Future<void> registCertificate(BuildContext context) async {
    isLoading = true.obs;
    final isValid = registCertiFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registCertiFormKey.currentState!.save();

    CertificateModel createCertificate = CertificateModel(
      certificateName: certificateNameController.text,
      certificateLink: certificateLinkController.text,
    );

    var response =
        await CertificateRepository.createNewCertificate(createCertificate);

    if (response.statusCode == 201) {
      // convert list exercises from json

      await logout();

      Get.back();
      Get.snackbar('Submit Certificate Success',
          'Wait for the system verify and login again');
      log(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      // thông báo lỗi
      Get.snackbar("Create failed!", jsonDecode(response.body)["message"]);
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }

    isLoading = false.obs;
  }
}
