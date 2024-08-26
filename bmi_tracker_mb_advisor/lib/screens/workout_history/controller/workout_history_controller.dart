import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

import '../../../models/workout_history_model.dart';
import '../../../repositories/workout_history_repository.dart';
import '../../../routes/app_routes.dart';

class WorkoutHistoryController extends GetxController {
  RxList<WorkoutHistoryModel> workoutHistoryModels = RxList.empty();
  var isLoading = false.obs;

  late int memberID;

  @override
  void onInit() {
    fetchDataWorkoutHistoryScreen();
    super.onInit();
  }

  Future<void> fetchDataWorkoutHistoryScreen() async {
    isLoading.value = true;
    memberID = Get.arguments!;
    await getWorkoutHistoryOfMember(memberID);
    isLoading.value = false;
  }

  getWorkoutHistoryOfMember(int memberID) async {
    // gọi API lấy danh sách menu history của advisor
    var response =
        await WorkoutHistoryRepository.getAllWorkoutHistory(memberID);

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list menu history from json
      String jsonResult = utf8.decode(response.bodyBytes);

      workoutHistoryModels.value = workoutHistoryModelsFromJson(jsonResult);
      workoutHistoryModels
          .sort((a, b) => b.dateOfAssigned!.compareTo(a.dateOfAssigned!));
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      workoutHistoryModels.clear();
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
        arguments: [workoutHistoryModels[index].workoutID, false]);
  }

  void assignWorkout() {
    Get.toNamed(AppRoutes.assignWorkoutScreen, arguments: memberID)
        ?.then((value) async {
      await fetchDataWorkoutHistoryScreen();
    });
  }
}
