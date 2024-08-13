import 'package:bmi_tracker_mb_advisor/repositories/authentication_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_routes.dart';
import '../forgot_password_complete_screen.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController txtEmailController;
  var errorString = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    txtEmailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    txtEmailController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty || !value.contains('@gmail.com')) {
      return "email is invalid";
    }
    return null;
  }

  Future<void> forgotPassword() async {
    isLoading = true.obs;

    final isValid = forgotPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgotPasswordFormKey.currentState!.save();

    String email = txtEmailController.text;
    http.Response response = await AuthenticationRepository.forgotPassword(
        'auth/forgot-password?email=$email');

    if (response.statusCode == 201) {
      Get.offAll(() => const ForgotPasswordComplete());
      // isUpdate = true;
      // Get.snackbar("Success");
    } else {
      errorString.value = 'Error your email';
    }

    isLoading.value = false;
  }
}
