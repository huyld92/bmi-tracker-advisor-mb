import 'dart:convert';
import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/models/enums/enum_user_request.dart';
import 'package:bmi_tracker_mb_advisor/models/request_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/request_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class CreateRequestController extends GetxController {
  final GlobalKey<FormState> createRequestFormKey = GlobalKey<FormState>();

  late TextEditingController txtFoodNameController;
  late TextEditingController txtExerciseNameController;
  late TextEditingController txtPurposeController;

  RxString requestType = ''.obs;

  // var type = '';
  var purposeToolTip = '';
  var errorString = ''.obs;
  var isLoading = false.obs;
  List<String> dropDownType = List.empty(growable: true);

  Rx<RequestModel> requestModel = RequestModel().obs;

  @override
  void onInit() {
    fetchCreateRequestScreenData();
    // txtTypeController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // dispose controller
    txtPurposeController.dispose();

    super.onClose();
  }

  void fetchCreateRequestScreenData() {
    isLoading.value = true;

    EUserRequestType argument = Get.arguments ?? EUserRequestType.OTHER;
    if (argument == EUserRequestType.CREATE_FOOD) {
      requestType.value = argument.name;
      dropDownType.add(requestType.value);
      purposeToolTip = 'msg_purpose_create_food_request'.tr;
      txtFoodNameController = TextEditingController();
    } else if (argument == EUserRequestType.CREATE_EXERCISE) {
      requestType.value = argument.name;
      dropDownType.add(requestType.value);
      purposeToolTip = 'msg_purpose_create_exercise_request'.tr;
      txtExerciseNameController = TextEditingController();
    } else {
      requestType.value = argument.name;
      dropDownType.add("Create food request");
      dropDownType.add("Create exercise request");
      dropDownType.add("Member");
      dropDownType.add("Other");
      purposeToolTip = 'msg_purpose_request_other'.tr;
    }

    txtPurposeController = TextEditingController();

    errorString.obs;
    isLoading.value = false;
  }

  String? validatePurpose(String value) {
    if (value.isEmpty) {
      return "Purpose is can't be empty";
    } else if (value.length < 5 || value.length > 255) {
      return "Purpose must be between 5 and 255 characters";
    }
    return null;
  }

  Future<void> createRequest() async {
    isLoading.value = true;
    final isValid = createRequestFormKey.currentState!.validate();

    if (!isValid) {
      isLoading.value = false;
      return;
    }

    createRequestFormKey.currentState!.save();
    String purpose;
    if (requestType.value == EUserRequestType.CREATE_FOOD.name) {
      purpose =
          "Food name:${txtFoodNameController.text}\n${txtPurposeController.text}";
    } else if (requestType.value == EUserRequestType.CREATE_EXERCISE.name) {
      purpose =
          "Exrecise name:${txtExerciseNameController.text}\n${txtPurposeController.text}";
    } else {
      purpose = "${txtPurposeController.text}";
    }

    RequestModel createRequest = RequestModel(
      type: requestType.value,
      purpose: purpose,
    );

    var response = await RequestRepository.createNewRequest(createRequest);
    print('response:${response.statusCode}');
    //kiểm tra kết quả
    if (response.statusCode == 200) {
      Get.back();
      Get.snackbar('Success', 'Create request successful');
      log(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      // thông báo lỗi
      Get.snackbar("Create failed!", jsonDecode(response.body)["purpose"]);
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }

    isLoading.value = false;
  }

  void selectType(String? newValue) {
    requestType.value = newValue!;

    if (newValue == EUserRequestType.CREATE_FOOD.name) {
      purposeToolTip = 'msg_purpose_create_food_request'.tr;
      txtFoodNameController = TextEditingController();
    } else if (newValue == EUserRequestType.CREATE_EXERCISE.name) {
      purposeToolTip = 'msg_purpose_create_exercise_request'.tr;
      txtExerciseNameController = TextEditingController();
    }
  }
}
