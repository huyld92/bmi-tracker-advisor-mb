import 'package:bmi_tracker_mb_advisor/screens/assign_workout/controller/assign_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class AssignWorkoutScreen extends GetView<AssignWorkoutController> {
  const AssignWorkoutScreen({super.key});

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
          // leading: IconButton(
          //     onPressed: () => Get.back(),
          //     icon: const Icon(LineAwesomeIcons.angle_left)),
          title:
              Text('txt_assign_workout'.tr, style: theme.textTheme.titleLarge),
        ),
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
                    const Spacer(),
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
                                          "${controller.workouts[index].workoutName}",
                                          style: theme.textTheme.titleLarge),
                                      Text(
                                        "${controller.workouts[index].totalCaloriesBurned} kcal",
                                        style: CustomTextStyles.bodyMedium14Red,
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
                                                        .workouts[index]
                                                        .isActive!
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
                                  ),
                                ),
                                // const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: TextButton(
                                    onPressed: () {
                                      controller.assignWorkout(index);
                                    },
                                    child: Text(
                                      "txt_assign".tr,
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
      );
    });
  }
}
