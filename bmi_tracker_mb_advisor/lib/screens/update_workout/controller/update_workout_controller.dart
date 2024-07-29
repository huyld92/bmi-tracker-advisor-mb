import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/workout_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/update_workout_request.dart';
import '../../../models/workout_model.dart';

class UpdateWorkoutController extends GetxController {
  late TextEditingController txtWorkoutNameController;
  late TextEditingController txtWorkoutDescriptionController;
  late TextEditingController txtStandardWeightController;
  late WorkoutModel workoutModel;

  @override
  void onInit() {
    fetchUpdateWorkoutData();
    super.onInit();
  }

  void fetchUpdateWorkoutData() {
    workoutModel = Get.arguments;
    txtWorkoutNameController =
        TextEditingController(text: workoutModel.workoutName);
    txtWorkoutDescriptionController =
        TextEditingController(text: workoutModel.workoutDescription);
    txtStandardWeightController =
        TextEditingController(text: workoutModel.standardWeight.toString());
  }

  Future<void> updateWorkout() async {
    workoutModel.workoutName = txtWorkoutNameController.text;
    workoutModel.workoutDescription = txtWorkoutDescriptionController.text;
    workoutModel.standardWeight = int.parse(txtStandardWeightController.text);

    WorkoutRequestModel workoutRequestModel = WorkoutRequestModel(
      workoutID: workoutModel.workoutID,
      workoutName: workoutModel.workoutName,
      workoutDescription: workoutModel.workoutDescription,
      standardWeight: workoutModel.standardWeight,
    );

// gọi API deactivate menu
    var response = await WorkoutRepository.updateWorkout(workoutRequestModel);
    // kiểm tra kết quả
    if (response.statusCode == 200) {
      WorkoutModel model = WorkoutModel.fromJson(jsonDecode(response.body));
      Get.back(result: model);
      Get.snackbar("Update workout", "Update workout success!");
    } else if (response.statusCode == 400) {
      Get.snackbar("Update workout", "Update workout failed!");
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
}
