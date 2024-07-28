import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/workout_model.dart';
import '../../../repositories/workout_repository.dart';

class WorkoutDetailsController extends GetxController {
  Rx<WorkoutModel> workoutModel = WorkoutModel().obs;

  var isLoading = false.obs;
  var isOwned = false.obs;

  @override
  void onInit() {
    fetchWorkoutDetailsData();
    super.onInit();
  }

  Future<void> fetchWorkoutDetailsData() async {
    isLoading.value = true;
    int workoutID = Get.arguments[0];
    isOwned.value = Get.arguments[1];
    await getWorkoutDetails(workoutID);
    isLoading.value = false;
  }

  getWorkoutDetails(int workoutID) async {
    // gọi API lấy danh sách workout của advisor
    var response = await WorkoutRepository.getWorkoutByWorkoutID(workoutID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      workoutModel.value = WorkoutModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 204) {
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

  void deactivateWorkoutExercise(int index) {}

  void activateWorkoutExercise(int index) {}

  void goToExerciseDetails(foodID) {}

  void goToAddExercise() {
    Get.toNamed(AppRoutes.addExerciseToWorkoutScreen,
        arguments: workoutModel.value.workoutID);
  }
}
