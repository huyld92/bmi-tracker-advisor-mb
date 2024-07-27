import 'package:bmi_tracker_mb_advisor/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../util/app_export.dart';
import 'controller/workout_controller.dart';

class WorkoutScreen extends GetView<WorkoutController> {
  const WorkoutScreen({super.key});

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
                        return Slidable(
                          key: Key(controller.workouts[index].workoutID.toString()),
                          endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.goToUpdateWorkout(index);
                                  },
                                  backgroundColor: const Color(0xFF1FBE1B),
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: 'txt_update'.tr,
                                ),
                                Obx(() {
                                  if (controller.workouts[index].isActive!) {
                                    return SlidableAction(
                                      onPressed: (context) {
                                        controller.deactivateWorkout(index);
                                      },
                                      backgroundColor: appTheme.red500,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'txt_deactivate'.tr,
                                    );
                                  } else {
                                    return SlidableAction(
                                      onPressed: (context) {
                                        controller.activateWorkout(index);
                                      },
                                      backgroundColor: const Color(0xFF1FBE1B),
                                      foregroundColor: Colors.white,
                                      icon: Icons.check_circle,
                                      label: 'txt_activate'.tr,
                                    );
                                  }
                                }),
                              ]),
                          //exercise list
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

                                      Obx(
                                            () => Row(
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.only(right: 5.h),
                                              child: Icon(
                                                Icons.circle,
                                                color: controller
                                                    .workouts[index].isActive!
                                                    ? appTheme.green500
                                                    : appTheme.red500,
                                              ),
                                            ),
                                            Obx(() {
                                              if (controller
                                                  .workouts[index].isActive!) {
                                                return Text(
                                                  "Active",
                                                  style: CustomTextStyles
                                                      .bodyMedium13Green,
                                                );
                                              } else {
                                                return Text(
                                                  "Inactive",
                                                  style: CustomTextStyles
                                                      .bodyMedium13Red,
                                                );
                                              }
                                            })
                                          ],
                                        ),
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
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: appTheme.green500,
          onPressed: () {
            controller.goToCreateNewWorkout();
          },
          child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
        ),
      );
    });
  }
}
