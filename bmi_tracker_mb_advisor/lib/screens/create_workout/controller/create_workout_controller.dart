import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/workout_repository.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/add_exercise_to_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout/controller/workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../../util/calories_calculator.dart';
import '../model/create_workout_model.dart';
import '../model/workout_exercise.dart';

class CreateWorkoutController extends GetxController {
  final GlobalKey<FormState> createWorkOutFormKey = GlobalKey<FormState>();
  late TextEditingController txtWorkoutNameController;
  late TextEditingController txtStandardWeightController;
  late TextEditingController txtWorkoutDescriptionController;
  RxList<WorkoutExercise> workoutExercises = RxList.empty();

  List<WorkoutExerciseRequest> workoutExerciseRequests =
      List.empty(growable: true);
  var workoutName = '';
  var standardweight = '';
  var workoutDescription = '';
  var isLoading = false.obs;

  @override
  void onInit() {
    txtWorkoutNameController = TextEditingController();
    txtStandardWeightController = TextEditingController(text: "0");
    txtWorkoutDescriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    txtWorkoutNameController.dispose();
    txtStandardWeightController.dispose();
    txtWorkoutDescriptionController.dispose();
    super.onClose();
  }

  String? validateWorkoutName(String value) {
    if (value.isEmpty) {
      return "Workout name is invalid";
    }
    return null;
  }

  String? validateStandardWeight(String value) {
    if (value.isEmpty) {
      return "Standard weight is invalid";
    }
    return null;
  }

  String? validateWorkoutDescription(String value) {
    if (value.isEmpty) {
      return "Workout Description is invalid";
    }
    return null;
  }

  Future<void> createNewWorkout() async {
    isLoading = true.obs;

    final isValid = createWorkOutFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    createWorkOutFormKey.currentState!.save();

    // weight = weight.isEmpty ? "0" : weight;
    // int standardWeight = int.parse(weight);
    CreateWorkoutModel createWorkoutModel = CreateWorkoutModel(
      workoutDescription: txtWorkoutDescriptionController.text,
      workoutName: txtWorkoutNameController.text,
      standardWeight: int.parse(txtStandardWeightController.text),
      workoutExerciseRequests: workoutExerciseRequests,
    );
    // gọi API create new workout
    var response = await WorkoutRepository.createNewWorkout(createWorkoutModel);
    print('response:${response.statusCode}');
    // kiểm tra kết quả
    if (response.statusCode == 201) {
      // convert list exercises from json
      Get.back();
      var workoutController = Get.find<WorkoutController>();
      await workoutController.fetchWorkoutScreenData();
      Get.snackbar("Create workout", "Create workout success!");
    } else if (response.statusCode == 401) {
      String message = jsonDecode(response.body)['message'];
      if (message.contains("JWT token is expired")) {
        Get.snackbar('Session Expired', 'Please login again');
      }
    } else {
      Get.snackbar("Error server ${response.statusCode}",
          jsonDecode(response.body)['message']);
    }
    isLoading.value = false;
  }

  void goToAddExercise() {
    // Get.dialog(AddExerciseToWorkoutScreen());
    Get.toNamed(AppRoutes.addExerciseToWorkoutScreen);
  }

  void removeExercise(int index) {
    workoutExercises.removeAt(index);
  }

  void onSubmittedStandardWeight(String? newValue) {
    for (var workoutExercise in workoutExercises) {
      double met = workoutExercise.met!;
      String weight = txtStandardWeightController.text;
      weight = weight.isEmpty ? "0" : weight;
      int weightKg = int.parse(weight);
      int duration = workoutExercise.duration!;
      workoutExercise.caloriesBurned =
          CaloriesCalculator.calculateCaloriesBurned(met, weightKg, duration);
    }
    workoutExercises.refresh();
  }
}
