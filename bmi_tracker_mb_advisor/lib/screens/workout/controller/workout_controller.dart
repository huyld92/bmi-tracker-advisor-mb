import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/workout_repository.dart';
import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
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

  void goToCreateNewWorkout() {
    Get.toNamed(AppRoutes.createWorkoutScreen);
  }

  void goToWorkoutDetails(int index) {
    Get.toNamed(AppRoutes.workoutDetailsScreen,
        arguments: [workouts[index].workoutID, true]);
  }

  Future<void> deactivateWorkout(int index) async {
    // gọi API deactivate workout
    var response =
        await WorkoutRepository.deactivateWorkout(workouts[index].workoutID);
    // kiểm tra kết quả
    if (response.statusCode == 204) {
      // 204 thành công cập nhật giá trị tại index
      workouts[index].isActive = false;
      workouts.refresh();
      Get.snackbar("Deactivate workout", "Deactivate workout success!");
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

  Future<void> activateWorkout(int index) async {
    // gọi API deactivate workout
    var response =
        await WorkoutRepository.activateWorkout(workouts[index].workoutID);
    // kiểm tra kết quả
    if (response.statusCode == 204) {
      // 204 thành công cập nhật giá trị tại index
      workouts[index].isActive = true;
      workouts.refresh();

      Get.snackbar("Activate workout", "Activate workout success!");
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

  void goToUpdateWorkout(int index) {
    Get.toNamed(AppRoutes.updateWorkoutScreen, arguments: workouts[index])
        ?.then((value) {
          if(value!=null){
            workouts[index]= value;
          }
    });
  }
}
