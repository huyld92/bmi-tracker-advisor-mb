import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/certificate_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/certificate_repository.dart';
import 'package:bmi_tracker_mb_advisor/screens/certificate/controller/certificate_controller.dart';
import 'package:flutter/material.dart';

import '../../../util/app_export.dart';

class CreateCertificateController extends GetxController {
  final GlobalKey<FormState> createCertificateFormKey = GlobalKey<FormState>();
  late TextEditingController txtCertificateNameController;
  late TextEditingController txtCertificateLinkController;

  var errorString = ''.obs;
  var isLoading = false.obs;

  Rx<CertificateModel> packageModel = CertificateModel().obs;

  @override
  void onInit() {
    txtCertificateNameController = TextEditingController();
    txtCertificateLinkController = TextEditingController();
    errorString.obs;
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    txtCertificateNameController.dispose();
    txtCertificateLinkController.dispose();

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

  Future<void> createCertificate() async {
    isLoading = true.obs;
    final isValid = createCertificateFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    createCertificateFormKey.currentState!.save();
    // print('aa:${planPriceController.text}');
    // double price = double.parse(packagePriceController.text);
    CertificateModel createCertificate = CertificateModel(
      certificateName: txtCertificateNameController.text,
      certificateLink: txtCertificateLinkController.text,
    );

    var response =
        await CertificateRepository.createNewCertificate(createCertificate);

    //kiểm tra kết quả
    if (response.statusCode == 201) {
      // convert list exercises from json
      var certificateController = Get.find<CertificateController>();
      await certificateController.fetchCertificate();

      Get.back();
      Get.snackbar('Success', 'Create certificate successful');
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
