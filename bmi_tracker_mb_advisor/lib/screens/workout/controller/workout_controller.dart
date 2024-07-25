import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/workout_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/workout_model.dart';

class WorkoutController extends GetxController {
  RxList<WorkoutModel> workouts = RxList.empty();

  var isLoading = false.obs;

  @override
  void onInit() {
    fetchWorkoutScreenData();

    super.onInit();
  }

  fetchWorkoutScreenData() async {
    isLoading.value = true;

    await getAllWorkout();

    isLoading.value = false;

    // workouts.add(WorkoutModel(
    //     workoutName: "workoutName",
    //     totalCaloriesBurned: 100,
    //     workoutDescription: "description",
    //     workoutID: 1,
    //     isActive: true),
    // );
    // workouts.add(WorkoutModel(
    //     workoutName: "workoutName",
    //     totalCaloriesBurned: 100,
    //     workoutDescription: "description",
    //     workoutID: 1,
    //     isActive: true),
    // );
    // workouts.add(WorkoutModel(
    //     workoutName: "workoutName",
    //     totalCaloriesBurned: 100,
    //     workoutDescription: "description",
    //     workoutID: 1,
    //     isActive: true),
    // );
  }

  Future<void> getAllWorkout() async {
    // gọi API lấy danh sách workout của advisor
    var response = await WorkoutRepository.getAllWorkout();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      workouts.value = workoutModelsFromJson(response.body);
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      workouts.clear();
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

  void floatingAddButton() {}

  void goToWorkoutDetails(int index) {
  }

  void deactivateWorkout(int index) {}

  void activateWorkout(int index) {}

  void goToUpdateWorkout(int index) {}
}