import 'package:bmi_tracker_mb_advisor/screens/update_workout/controller/update_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/theme/custom_button_style.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class UpdateWorkoutScreen extends GetView<UpdateWorkoutController> {
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'title_appbar_update_workout'.tr,
                    style: theme.textTheme.titleLarge,
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
                  controller: controller.txtWorkoutNameController,
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
                  controller: controller.txtStandardWeightController,
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
                  controller: controller.txtWorkoutDescriptionController,
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
              FocusScope.of(context).unfocus();
              controller.updateWorkout();
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
