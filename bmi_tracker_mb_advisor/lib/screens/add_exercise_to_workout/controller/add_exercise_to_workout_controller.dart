import 'dart:convert';

import 'package:bmi_tracker_mb_advisor/models/enums/enum_user_request.dart';
import 'package:bmi_tracker_mb_advisor/models/exercise_model.dart';
import 'package:bmi_tracker_mb_advisor/repositories/exercise_repository.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_workout/model/workout_exercise.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout_details/controller/workout_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/theme/custom_button_style.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/util/calories_calculator.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';
import '../../create_workout/controller/create_workout_controller.dart';
import '../../create_workout/model/create_workout_model.dart';
import '../../workout_details/model/workout_exercise_request_model.dart';

class AddExerciseToWorkoutController extends GetxController {
  List<ExerciseModel> exerciseDefaults = List.empty();
  RxList<ExerciseModel> exerciseUIModels = RxList.empty();
  RxInt caloriesBurned = 0.obs;
  int? workoutID;
  var isLoading = false.obs;

  // giá trị của sort
  RxString currentSortCriteria = 'Sort A-Z'.obs;

  @override
  Future<void> onInit() async {
    fetchAddExerciseToWorkout();
    super.onInit();
  }

  Future<void> refreshData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    await fetchAddExerciseToWorkout();
    isLoading.value = false;
    update();
  }

  fetchAddExerciseToWorkout() async {
    isLoading.value = true;
    workoutID = Get.arguments;
    await getAllExercise();
    isLoading.value = false;
  }

  getAllExercise() async {
    // gọi API lấy danh sách menu của advisor
    var response = await ExerciseRepository.getAllExercise();

    // kiểm tra kết quả
    if (response.statusCode == 200) {
      // convert list exercises from json
      String jsonResult = utf8.decode(response.bodyBytes);

      exerciseUIModels.value = exerciseModelsFromJson(jsonResult);
      exerciseDefaults = exerciseModelsFromJson(jsonResult);
    } else if (response.statusCode == 204) {
      // xóa list hiện tại khi kết quả là rỗng
      exerciseDefaults.clear();
      exerciseUIModels.clear();
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

  void onSelectExercise(int index) {
    if (workoutID == null) {
      var createWorkoutController = Get.find<CreateWorkoutController>();
      TextEditingController txtDurationController = TextEditingController();
      String weight = createWorkoutController.txtStandardWeightController.text;
      weight = weight.isEmpty ? "0" : weight;
      Get.defaultDialog(
        backgroundColor: Colors.white,
        title: "${"txt_duration".tr} (${"txt_min".tr}):",
        titleStyle: CustomTextStyles.titleMedium16Black,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextFormField(
                maxLines: 1,
                controller: txtDurationController,
                // validator: (value) {
                //   return feedbackController.validateTitle(val ue!);
                // },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'txt_hint_duration'.tr,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    int duration = int.parse(value);
                    calculatorCaloriesBurned(
                        index, duration, int.parse(weight));
                  } else {
                    caloriesBurned.value = 0;
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
              child: Obx(
                () => RichText(
                  text: TextSpan(
                      text: "${"txt_calories_burned".tr}: ",
                      style: CustomTextStyles.titleMedium16Black,
                      children: [
                        TextSpan(
                            text: "$caloriesBurned kcal",
                            style: CustomTextStyles.bodyMedium14)
                      ]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: RichText(
                text: TextSpan(
                    text: "${"txt_standard_weight".tr}: ",
                    style: CustomTextStyles.titleMedium16Black,
                    children: [
                      TextSpan(
                          text: "$weight kg",
                          style: CustomTextStyles.bodyMedium14)
                    ]),
              ),
            ),
          ],
        ),
        barrierDismissible: false,
        cancel: ElevatedButton(
          onPressed: () {
            Get.back();
            caloriesBurned.value = 0;
          },
          style: CustomButtonStyles.outlineButtonGrey300,
          child:
              Text("txt_cancel".tr, style: CustomTextStyles.bodyMedium14White),
        ),
        confirm: ElevatedButton(
          onPressed: () async {
            if (txtDurationController.text.isNotEmpty) {
              Get.back();
              int duration = int.parse(txtDurationController.text);
              await addExerciseToWorkout(index, duration);
              caloriesBurned.value = 0;
              Get.back();
            }
          },
          style: CustomButtonStyles.outlineButtonGreen500,
          child: Text("txt_ok".tr, style: CustomTextStyles.bodyMedium14White),
        ),
      );
    } else {
      var workoutDetailsController = Get.find<WorkoutDetailsController>();
      TextEditingController txtDurationController = TextEditingController();
      String weight =
          workoutDetailsController.workoutModel.value.standardWeight.toString();

      Get.defaultDialog(
        backgroundColor: Colors.white,
        title: "${"txt_duration".tr} (${"txt_min".tr}):",
        titleStyle: CustomTextStyles.titleMedium16Black,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextFormField(
                maxLines: 1,
                controller: txtDurationController,
                // validator: (value) {
                //   return feedbackController.validateTitle(val ue!);
                // },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'txt_hint_duration'.tr,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    int duration = int.parse(value);
                    calculatorCaloriesBurned(
                        index, duration, int.parse(weight));
                  } else {
                    caloriesBurned.value = 0;
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
              child: Obx(
                () => RichText(
                  text: TextSpan(
                      text: "${"txt_calories_burned".tr}: ",
                      style: CustomTextStyles.titleMedium16Black,
                      children: [
                        TextSpan(
                            text: "$caloriesBurned kcal",
                            style: CustomTextStyles.bodyMedium14)
                      ]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: RichText(
                text: TextSpan(
                    text: "${"txt_standard_weight".tr}: ",
                    style: CustomTextStyles.titleMedium16Black,
                    children: [
                      TextSpan(
                          text: "$weight kg",
                          style: CustomTextStyles.bodyMedium14)
                    ]),
              ),
            ),
          ],
        ),
        barrierDismissible: false,
        cancel: ElevatedButton(
          onPressed: () {
            Get.back();
            caloriesBurned.value = 0;
          },
          style: CustomButtonStyles.outlineButtonGrey300,
          child:
              Text("txt_cancel".tr, style: CustomTextStyles.bodyMedium14White),
        ),
        confirm: ElevatedButton(
          onPressed: () async {
            if (txtDurationController.text.isNotEmpty) {
              Get.back();
              int duration = int.parse(txtDurationController.text);
              await addExerciseToWorkout(index, duration);
              caloriesBurned.value = 0;
            }
          },
          style: CustomButtonStyles.outlineButtonGreen500,
          child: Text("txt_ok".tr, style: CustomTextStyles.bodyMedium14White),
        ),
      );
    }
  }

  void calculatorCaloriesBurned(int index, int duration, int weightKg) {
    double met = exerciseUIModels[index].met!;
    caloriesBurned.value =
        CaloriesCalculator.calculateCaloriesBurned(met, weightKg, duration);
  }

  Future<void> addExerciseToWorkout(int index, int duration) async {
    if (workoutID == null) {
      var createWorkoutController = Get.find<CreateWorkoutController>();

      WorkoutExercise workoutExercise = WorkoutExercise(
        exerciseID: exerciseUIModels[index].exerciseID,
        exerciseName: exerciseUIModels[index].exerciseName,
        caloriesBurned: caloriesBurned.value,
        duration: duration,
        met: exerciseUIModels[index].met,
        emoji: exerciseUIModels[index].emoji,
      );
      createWorkoutController.workoutExercises.add(workoutExercise);
      createWorkoutController.workoutExerciseRequests.add(
        WorkoutExerciseRequest(
            duration: duration, exerciseID: exerciseUIModels[index].exerciseID),
      );
    } else {
      WorkoutExerciseRequestModel weRequestModel = WorkoutExerciseRequestModel(
        exerciseID: exerciseUIModels[index].exerciseID,
        duration: duration,
        workoutID: workoutID,
      );
      Get.back(result: weRequestModel);
    }
  }

  void goToExerciseDetails(int index) {
    Get.toNamed(AppRoutes.exerciseDetailsScreen,
        arguments: exerciseUIModels[index]);
  }

  void goToCreateRequest() {
    Get.toNamed(AppRoutes.createRequestScreen,
        arguments: EUserRequestType.CREATE_EXERCISE);
  }

  void searchExerciseName(String value) {
    // xóa danh sách exercise đang hiển thị hiện tại
    exerciseUIModels.clear();

    // nếu giá trị của search box empty thì hiển thị tất cả food
    if (value.isEmpty) {
      exerciseUIModels.addAll(exerciseDefaults);
    } else {
      // duyệt danh sách food default để tìm food name theo value
      for (var exercise in exerciseDefaults) {
        // chuyển foodName và value và lowerCase để so sánh
        if (exercise.exerciseName!
            .toLowerCase()
            .contains(value.toLowerCase())) {
          // nếu food Name có giá trị phù hợp với value => thêm food vào foodUIModels
          exerciseUIModels.add(exercise);
        }
      }
    }
    sortExercise(currentSortCriteria.value);
  }

  void sortExercise(String? newValue) {
    // cập nhật giá trị đang được chọn của sort
    currentSortCriteria.value = newValue!;

    // Xác định giá trị đang được chọn
    switch (currentSortCriteria.value) {
      // Alphabet giảm dần
      case 'Sort A-Z':
        exerciseUIModels
            .sort((a, b) => a.exerciseName!.compareTo(b.exerciseName!));
        break;
      // Alphabet tăng dần
      case 'Sort Z-A':
        exerciseUIModels
            .sort((a, b) => b.exerciseName!.compareTo(a.exerciseName!));
        break;
      //  mới nhất
      case 'Sort Newest':
        exerciseUIModels.sort((a, b) => b.exerciseID!.compareTo(a.exerciseID!));
        break;
      //  cũ nhất
      case 'Sort Oldest':
        exerciseUIModels.sort((a, b) => a.exerciseID!.compareTo(b.exerciseID!));
        break;
    }
  }
}
