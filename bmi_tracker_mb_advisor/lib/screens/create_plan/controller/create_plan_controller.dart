// import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/repositories/plan_repository.dart';
import 'package:bmi_tracker_mb_advisor/screens/plan/controller/plan_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/plan/model/plan_model.dart';
import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart';
import '../../../util/app_export.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

class CreatePlanController extends GetxController {
  final GlobalKey<FormState> createPlanFormKey = GlobalKey<FormState>();
  late TextEditingController txtPlanNameController;
  late TextEditingController planPriceController;
  late TextEditingController planDescriptionController;
  late TextEditingController planDurationController;

  var planName = '';
  var planPrice = '';
  var link = '';
  var planDescription = '';
  var planDuration = '';
  var errorString = ''.obs;
  var isLoading = false.obs;

  Rx<PlanModel> planModel = PlanModel().obs;

  @override
  void onInit() {
    txtPlanNameController = TextEditingController();
    planPriceController = TextEditingController();
    planDescriptionController = TextEditingController();
    planDurationController = TextEditingController();
    errorString.obs;
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    txtPlanNameController.dispose();
    planPriceController.dispose();
    planDescriptionController.dispose();
    planDurationController.dispose();
    super.onClose();
  }

  String? validatePlanName(String value) {
    if (value.isEmpty) {
      return "Plan name is invalid";
    }
    return null;
  }

  String? validatePlanPrice(String value) {
    if (value.isEmpty) {
      return "Price is invalid";
    }
    return null;
  }

  String? validatePlanDescription(String value) {
    if (value.isEmpty) {
      return "Plan Description is invalid";
    }
    return null;
  }

  String? validatePlanDuration(String value) {
    if (value.isEmpty) {
      return "Plan Duration is invalid";
    }
    return null;
  }

  Future<void> createPlan() async {
    isLoading = true.obs;
    final isValid = createPlanFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    createPlanFormKey.currentState!.save();
    print('aa:${planPriceController.text}');
    double price = double.parse(planPriceController.text);
    PlanModel createPlan = PlanModel(
      planName: txtPlanNameController.text,
      price: price,
      description: planDescriptionController.text,
      planDuration: int.parse(planDurationController.text),
    );

    var response = await PlanRepository.createNewPlan(createPlan);

    //kiểm tra kết quả
    if (response.statusCode == 201) {
      // convert list exercises from json
      var planController = Get.find<PlanController>();
      await planController.fetchPlan();

      Get.back();
      Get.snackbar('Success', 'Create plan successful');
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
