import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../repositories/feedback_repository.dart';
import '../model/feedback_model.dart';

class FeedbackController extends GetxController {
  final GlobalKey<FormState> feedbackFormKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  // late TextEditingController typeController;
  late TextEditingController descriptionController;
  // late TextEditingController sexController;
  // var statusIsBlank = false.obs;
  late String sexValue;
  var isLoading = true.obs;
  var errorString = ''.obs;
  var meals = <String>[].obs;
  var feedback = <FeedbackModel>[].obs;
  // final loginController = Get.put(LoginController());

  // late MemberModel currentMember;
  late String feedbackType;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    feedbackType = 'Menu';
    descriptionController = TextEditingController();
    // currentMember = loginController.loginedMember.value;
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();

    super.onClose();
  }

  String? validateTitle(String value) {
    if (value.isEmpty) {
      return "Title is invalid";
    }

    return null;
  }

  String? validateDescription(String value) {
    if (value.isEmpty) {
      return "description is invalid";
    }
    return null;
  }

  Future<String?> registerFeedback(BuildContext context) async {
    // {required List<String> menus}) async {
    FeedbackModel feedback = FeedbackModel(
      title: titleController.text,
      type: feedbackType,
      description: descriptionController.text,
      // sex: 0,
      // userId: currentMember.memberId.toString(),
    );

    // sex: sexController.text);

    var response = await FeedbackRepository.registerFeedback(
        registFeedbackToJson(feedback), 'feedback');

    log('feedback controller response: ${response.toString()}');
    print('feedback: ${feedback}');

    errorString.value = '';
    isLoading.value = false;
    return null;
  }
}
