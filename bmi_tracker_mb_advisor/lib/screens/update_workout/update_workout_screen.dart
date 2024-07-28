import 'package:bmi_tracker_mb_advisor/theme/custom_button_style.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_helper.dart';

class UpdateWorkoutScreen extends StatelessWidget {
  const UpdateWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          toolbarHeight: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'title_appbar_crete_workout'.tr,
                    'Update Workout',
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    'create a workout suitable for your member',
                    // 'Welcome Van Tung',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.v),
          child: Container(
            margin: EdgeInsets.only(bottom: 80.v),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: appTheme.blueA700,
                        radius: 40,
                        child: Image(
                          image: const AssetImage('assets/images/workout.png'),
                          width: 40.adaptSize,
                          height: 40.adaptSize,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'txt_workout_name'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.v),
                TextFormField(
                  maxLines: 1,
                  // controller: controller.txtWorkoutNameController,
                  // validator: (value) {
                  //   return feedbackController.validateTitle(value!);
                  // },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'txt_hint_workout_name'.tr,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  'txt_standard_weight'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.v),
                TextFormField(
                  maxLines: 1,
                  // controller: controller.txtStandardWeightController,
                  // validator: (value) {
                  //   return feedbackController.validateTitle(value!);
                  // },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'txt_hint_standard_weight'.tr,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10.v),
                Text(
                  'txt_workout_description'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  // controller: controller.txtWorkoutDescriptionController,
                  // validator: (value) {
                  //   return feedbackController.validateTitle(value!);
                  // },

                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1.0),
                    ),
                    hintText: 'txt_hint_workout_description'.tr,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.v),
                  child: Text(
                    "txt_exercises".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  // itemCount: controller.workoutExercises.length,
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 280.h,
                                  child: Text(
                                    // "${controller.workoutExercises[index].emoji} "
                                    // "${controller.workoutExercises[index].exerciseName!}",
                                    "emoji"
                                    "exerciseName",
                                    maxLines: 3,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.titleMedium16Black,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text:
                                        // "${controller.workoutExercises[index].duration!.formatWithThousandSeparator()} min, ",
                                        "30 min",
                                    style: theme.textTheme.bodyMedium,
                                    children: [
                                      TextSpan(
                                        text:
                                            // "${controller.workoutExercises[index].caloriesBurned!.formatWithThousandSeparator()} kcal",
                                            "300 kcal",
                                        style: theme.textTheme.bodyMedium,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                // controller.removeExercise(index);
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
                // add exercise button
                InkWell(
                  onTap: () {
                    // controller.goToAddExercise();
                  },
                  child: Container(
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
                              style: CustomTextStyles.bodyMediumGreen500),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider()
              ],
            ),
          ),
        ),
        // save workout button
        floatingActionButton: SizedBox(
          height: 50.v,
          width: 200.h,
          child: ElevatedButton(
            style: CustomButtonStyles.outlineButtonGreen500,
            onPressed: () {
              // controller.createNewWorkout();
            },
            child: Text(
              "txt_save".tr,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
