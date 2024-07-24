import 'package:bmi_tracker_mb_advisor/theme/custom_text_style.dart';
import 'package:flutter/material.dart';

import '../../util/app_export.dart';
import 'controller/workout_controller.dart';

class WorkoutScreen extends GetView<WorkoutController> {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.transparent),
        );
      }
      return Scaffold(
        backgroundColor: appTheme.grey100,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${"txt_total".tr} (${controller.workouts.length})"),
                    Spacer(),
                    Text("txt_sort_by".tr),
                  ],
                ),
              ),
              Expanded(
                  flex: 15,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.workouts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 10.v),
                          margin: EdgeInsets.only(bottom: 10.v),
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.adaptSize)),
                            boxShadow: [
                              BoxShadow(
                                color: appTheme.grey300,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${controller.workouts[index].workoutName}",
                                        style: theme.textTheme.titleLarge),
                                    Text(
                                      "${controller.workouts[index].totalCaloriesBurned} kcal",
                                      style: CustomTextStyles.bodyMedium13Red,
                                    ),
                                    Text(
                                      "${controller.workouts[index].workoutDescription}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              // const Spacer(),
                              Expanded(
                                flex: 3,
                                child: TextButton(
                                  onPressed: () {
                                    controller.goToWorkoutDetails(index);
                                  },
                                  child: Text(
                                    "txt_view_details".tr,
                                    style: CustomTextStyles.linkTextStyle14,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: appTheme.green500,
          onPressed: () {
            controller.floatingAddButton();
          },
          child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
        ),
      );
    });
  }
}
