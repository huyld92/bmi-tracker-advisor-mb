import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../repositories/authentication_repository.dart';
import '../../../routes/app_routes.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController rePasswordController;
  RxBool oldPasswordVisible = true.obs;
  RxBool newPasswordVisible = true.obs;
  RxBool confirmPasswordVisible = true.obs;
  var errorString = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    rePasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    oldPasswordController.dispose();
    newPasswordController.dispose();
    rePasswordController.dispose();
    super.onClose();
  }

  String? validateOldPassword(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length < 6) {
      return "Password have at least 6 words.";
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Password must contain at least one special character";
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain at least one number";
    }
    return null;
  }

  String? validateRePassword(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value != newPasswordController.text) {
      return "Password does not match";
    }
    return null;
  }

  Future<void> changePassword() async {
    isLoading.value = true;
    final isValid = changePasswordFormKey.currentState!.validate();
    if (!isValid) {
      isLoading.value = false;
      return;
    }
    changePasswordFormKey.currentState!.save();

    String oldPassword = oldPasswordController.text;
    String newPassword = newPasswordController.text;
    http.Response response = await AuthenticationRepository.changePassword(
        'accounts/change-password?oldPassword=$oldPassword&newPassword=$newPassword');

    if (response.statusCode == 200) {
      Get.back();
      oldPasswordController.clear();
      newPasswordController.clear();
      rePasswordController.clear();
      Get.snackbar("Success", 'You have changed your password');
    } else {
      errorString.value = 'Error your password';
    }

    isLoading.value = false;
  }
}
