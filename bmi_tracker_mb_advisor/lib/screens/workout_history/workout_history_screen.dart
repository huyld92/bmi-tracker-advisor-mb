import 'package:bmi_tracker_mb_advisor/screens/workout_history/controller/workout_history_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class WorkoutHistoryScreen extends GetView<WorkoutHistoryController> {
  const WorkoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          backgroundColor: appTheme.white,
          body: Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(appTheme.green500),
            ),
          ),
        );
      }
      return Scaffold(
        backgroundColor: appTheme.grey100,
        appBar: AppBar(
          title: Text("title_appbar_workout_history".tr,
              style: theme.textTheme.titleLarge),
        ),
        body: Obx(() {
          if (controller.workoutHistoryModels.isEmpty) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/not_found.png",
                      width: 128.adaptSize),
                  Text("${"txt_no_data_available_yet".tr}.",
                      style: CustomTextStyles.titleMedium16Black),
                  // Text("body_no_results".tr, style: theme.textTheme.bodyMedium,)
                ],
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "${"txt_total".tr} (${controller.workoutHistoryModels.length})"),
                      // const Spacer(),
                      // Text("txt_sort_by".tr),
                    ],
                  ),
                ),
                Expanded(
                    flex: 15,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.workoutHistoryModels.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.goToWorkoutDetails(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.h, vertical: 10.v),
                              margin: EdgeInsets.only(bottom: 10.v),
                              decoration: BoxDecoration(
                                color: appTheme.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.adaptSize)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${controller.workoutHistoryModels[index].workoutName}",
                                            style: theme.textTheme.titleLarge),
                                        Text(
                                          "${controller.workoutHistoryModels[index].workoutDescription}",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              controller
                                                  .workoutHistoryModels[index]
                                                  .dateOfAssigned!
                                                  .format(),
                                              style: theme.textTheme.bodyMedium,
                                            ),
                                            Text(
                                              "${controller.workoutHistoryModels[index].totalCaloriesBurned} kcal",
                                              style: CustomTextStyles
                                                  .bodyMedium14Green,
                                            ),
                                            Obx(
                                              () => Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5.h),
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 16.adaptSize,
                                                      color: controller
                                                              .workoutHistoryModels[
                                                                  index]
                                                              .isActive!
                                                          ? appTheme.green500
                                                          : appTheme.red500,
                                                    ),
                                                  ),
                                                  Obx(() {
                                                    if (controller
                                                        .workoutHistoryModels[
                                                            index]
                                                        .isActive!) {
                                                      return Text(
                                                        "Active",
                                                        style: CustomTextStyles
                                                            .bodyMedium14Green,
                                                      );
                                                    } else {
                                                      return Text(
                                                        "Inactive",
                                                        style: CustomTextStyles
                                                            .bodyMedium14Red,
                                                      );
                                                    }
                                                  })
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ))
              ],
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: appTheme.green500,
          onPressed: () {
            controller.assignWorkout();
          },
          child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
        ),
      );
    });
  }
}
