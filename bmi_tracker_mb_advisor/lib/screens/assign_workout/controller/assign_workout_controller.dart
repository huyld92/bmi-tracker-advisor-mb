import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/repositories/workout_repository.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/workout_model.dart';
import '../../../routes/app_routes.dart';

class AssignWorkoutController extends GetxController {
  RxList<WorkoutModel> workouts = RxList.empty();
  late int memberID;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchDataAssignWorkoutScreen();
    super.onInit();
  }

  Future<void> fetchDataAssignWorkoutScreen() async {
    isLoading.value = true;
    await getAvailableWorkout();
    memberID = Get.arguments;
    isLoading.value = false;
  }

  getAvailableWorkout() async {
    // gọi API lấy danh sách menu của advisor
    var response = await WorkoutRepository.getAvailableWorkout();

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

  void goToWorkoutDetails(int index) {
    Get.toNamed(AppRoutes.workoutDetailsScreen,
        arguments: [workouts[index].workoutID, true]);
  }

  Future<void> assignWorkout(int index) async {
    // gọi API lấy danh sách menu của advisor
    int workoutID = workouts[index].workoutID!;
    var response = await WorkoutRepository.assignWorkout(memberID, workoutID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      Get.back(result: true);
      Get.snackbar("Assign workout", "Assign workout success!");
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
