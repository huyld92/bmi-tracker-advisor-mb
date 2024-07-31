import 'package:bmi_tracker_mb_advisor/screens/workout_details/controller/workout_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:bmi_tracker_mb_advisor/util/tag_emoji_utils.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsScreen extends GetView<WorkoutDetailsController> {
  const WorkoutDetailsScreen({super.key});

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
          title: Obx(
            () => Text(
              "${controller.workoutModel.value.workoutName}",
              style: theme.textTheme.titleLarge,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.v),
          child: Container(
            margin: EdgeInsets.only(bottom: 70.v),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: CustomImageView(
                          imagePath: "assets/images/workout.png",
                        ),
                      ),
                    ],
                  ),
                ),
                // menu information
                Container(
                  margin: EdgeInsets.only(top: 15.v),
                  padding: EdgeInsets.all(10.v),
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: appTheme.grey500,
                        // offset: Offset(0, 5),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.v),
                        child: RichText(
                          text: TextSpan(
                              text: "${"txt_total_calories".tr}: ",
                              style: theme.textTheme.titleSmall,
                              children: [
                                TextSpan(
                                  text:
                                      "${controller.workoutModel.value.totalCaloriesBurned!.formatWithThousandSeparator()} kcal",
                                  style: CustomTextStyles.bodyMedium16,
                                )
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.v),
                        child: RichText(
                          text: TextSpan(
                              text: "${"txt_standard_weight".tr}: ",
                              style: theme.textTheme.titleSmall,
                              children: [
                                TextSpan(
                                  text:
                                      "${controller.workoutModel.value.standardWeight} kg",
                                  style: CustomTextStyles.bodyMedium16,
                                )
                              ]),
                        ),
                      ),
                      Obx(() {
                        if (controller.workoutModel.value.workoutDescription!
                            .isNotEmpty) {
                          return RichText(
                            text: TextSpan(
                                text: "${"txt_description".tr}: ",
                                style: theme.textTheme.titleSmall,
                                children: [
                                  TextSpan(
                                    text:
                                        "${controller.workoutModel.value.workoutDescription}",
                                    style: CustomTextStyles.bodyMedium16,
                                  )
                                ]),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      Padding(
                        padding: EdgeInsets.only(top: 10.v),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5.h),
                              child: Icon(
                                Icons.circle,
                                size: 16.adaptSize,
                                color: controller.workoutModel.value.isActive!
                                    ? appTheme.green500
                                    : appTheme.red500,
                              ),
                            ),
                            Obx(() {
                              if (controller.workoutModel.value.isActive!) {
                                return Text(
                                  "Active",
                                  style: CustomTextStyles.bodyMedium16Green,
                                );
                              } else {
                                return Text(
                                  "Inactive",
                                  style: CustomTextStyles.bodyMedium16Red,
                                );
                              }
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //workout exercise information
                Container(
                  margin: EdgeInsets.only(top: 20.v, bottom: 10.v),
                  child: Text(
                    "txt_exercises".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                // Obx(
                //   () => ListView.builder(
                //     shrinkWrap: true,
                //     itemCount:
                //         controller.workoutModel.value.workoutExercises?.length,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return Slidable(
                //         key: Key(controller.workoutModel.value
                //             .workoutExercises![index].workoutExerciseID
                //             .toString()),
                //         endActionPane:
                //             ActionPane(motion: const ScrollMotion(), children: [
                //           Obx(() {
                //             if (controller.workoutModel.value
                //                 .workoutExercises![index].isActive!) {
                //               return SlidableAction(
                //                 onPressed: (context) {
                //                   controller.deactivateWorkoutExercise(index);
                //                 },
                //                 backgroundColor: appTheme.red500,
                //                 foregroundColor: Colors.white,
                //                 icon: Icons.delete,
                //                 label: 'txt_deactivate'.tr,
                //               );
                //             } else {
                //               return SlidableAction(
                //                 onPressed: (context) {
                //                   controller.activateWorkoutExercise(index);
                //                 },
                //                 backgroundColor: const Color(0xFF1FBE1B),
                //                 foregroundColor: Colors.white,
                //                 icon: Icons.check_circle,
                //                 label: 'txt_activate'.tr,
                //               );
                //             }
                //           }),
                //         ]),
                //         child: GestureDetector(
                //           onTap: () {
                //             controller.goToExerciseDetails(controller
                //                 .workoutModel
                //                 .value
                //                 .workoutExercises![index]
                //                 .exerciseID);
                //           },
                //           child: Container(
                //             padding: EdgeInsets.all(10.v),
                //             color: appTheme.white,
                //             child: Column(
                //               children: [
                //                 Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         SizedBox(
                //                           width: 280.h,
                //                           child: Text(
                //                             controller
                //                                 .workoutModel
                //                                 .value
                //                                 .workoutExercises![index]
                //                                 .exerciseName!,
                //                             style: CustomTextStyles
                //                                 .titleMedium16Black,
                //                           ),
                //                         ),
                //                         RichText(
                //                             text: TextSpan(
                //                                 text:
                //                                     "${controller.workoutModel.value.workoutExercises![index].duration.toString()} ${"txt_min".tr}, ",
                //                                 style: CustomTextStyles
                //                                     .bodyMedium16,
                //                                 children: [
                //                               TextSpan(
                //                                 text:
                //                                     "${controller.workoutModel.value.workoutExercises![index].caloriesBurned!} kcal",
                //                               ),
                //                             ])),
                //                       ],
                //                     ),
                //
                //                     Container(
                //                       margin: EdgeInsets.only(right: 5.h),
                //                       child: Icon(
                //                         Icons.circle,
                //                         size: 16.adaptSize,
                //                         color: controller
                //                                 .workoutModel
                //                                 .value
                //                                 .workoutExercises![index]
                //                                 .isActive!
                //                             ? appTheme.green500
                //                             : appTheme.red500,
                //                       ),
                //                     ),
                //                     // Obx(() {
                //                     //   if (controller.menuDetailsModel.value
                //                     //       .menuFoods![index].isActive!) {
                //                     //     return Text(
                //                     //       "Active",
                //                     //       style: CustomTextStyles.bodyMedium13Green,
                //                     //     );
                //                     //   } else {
                //                     //     return Text(
                //                     //       "Inactive",
                //                     //       style: CustomTextStyles.bodyMedium13Red,
                //                     //     );
                //                     //   }
                //                     // })
                //                   ],
                //                 ),
                //                 // const Divider()
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                //exercises
                Container(
                  margin: EdgeInsets.only(top: 5.v),
                  padding: EdgeInsets.all(10.v),
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: appTheme.grey500,
                        // offset: Offset(0, 5),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller
                              .workoutModel.value.workoutExercises!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 260.h,
                                          child: Text(
                                            "${TagEmojiUtils.getEmojiForTag(controller.workoutModel.value.workoutExercises![index].tagID)} "
                                            "${controller.workoutModel.value.workoutExercises![index].exerciseName!}",
                                            maxLines: 3,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .titleMedium16Black,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                "${controller.workoutModel.value.workoutExercises![index].duration!.formatWithThousandSeparator()} min, ",
                                            style: theme.textTheme.bodyMedium,
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${controller.workoutModel.value.workoutExercises![index].caloriesBurned!.formatWithThousandSeparator()} kcal",
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.deleteWorkoutExercise(index);
                                      },
                                      icon: Icon(
                                        Icons.highlight_remove,
                                        color: appTheme.red500,
                                      ),
                                    )
                                  ],
                                ),
                                const Divider()
                              ],
                            );
                          },
                        ),
                      ),
                      Obx(() {
                        if (controller.isOwned.value) {
                          return InkWell(
                            onTap: () {
                              controller.goToAddExercise();
                            },
                            child: SizedBox(
                              height: 40.v,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: appTheme.green500,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text("txt_add_exercise".tr,
                                        style: CustomTextStyles
                                            .bodyMediumGreen500),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      const Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
