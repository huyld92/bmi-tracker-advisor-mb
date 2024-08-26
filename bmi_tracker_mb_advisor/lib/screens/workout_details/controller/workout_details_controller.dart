import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/routes/app_routes.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/workout_exercise_model.dart';
import '../../../models/workout_model.dart';
import '../../../repositories/workout_repository.dart';
import '../model/workout_exercise_request_model.dart';

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
      String jsonResult = utf8.decode(response.bodyBytes);

      workoutModel.value = WorkoutModel.fromJson(jsonDecode(jsonResult));
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

  createWorkoutExercise(WorkoutExerciseRequestModel requestModel) async {
    isLoading.value = true;
    // gọi API create workout exercise
    var response = await WorkoutRepository.createWorkoutExercise(requestModel);

    // kiểm tra kết quả
    if (response.statusCode == 201) {
      // thành công cập nhật lại giao diện
      int workoutID = workoutModel.value.workoutID!;
      workoutModel.value = WorkoutModel();
      await getWorkoutDetails(workoutID);
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
    isLoading.value = false;
  }

  void goToExerciseDetails(foodID) {}

  void goToAddExercise() {
    Get.toNamed(AppRoutes.addExerciseToWorkoutScreen,
            arguments: workoutModel.value.workoutID)
        ?.then((value) async {
      if (value != null) {
        await createWorkoutExercise(value);
      }
    });
  }

  Future<void> deleteWorkoutExercise(int index) async {
    isLoading.value = true;
    // gọi API create workout exercise
    int workoutExerciseID =
        workoutModel.value.workoutExercises![index].workoutExerciseID!;
    var response =
        await WorkoutRepository.deleteWorkoutExercise(workoutExerciseID);

    // kiểm tra kết quả
    if (response.statusCode == 204) {
      // thành công cập nhật lại giao diện
      int workoutID = workoutModel.value.workoutID!;
      workoutModel.value = WorkoutModel();
      await getWorkoutDetails(workoutID);
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
}
