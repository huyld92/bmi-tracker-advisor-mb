import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/controller/add_exercise_to_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_text_style.dart';

class AddExerciseToWorkoutScreen
    extends GetView<AddExerciseToWorkoutController> {
  const AddExerciseToWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "title_add_exercise_to_workout".tr,
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.v),
                  child: Obx(
                    () => GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio:
                            0.7, // Adjust the aspect ratio as needed
                      ),
                      itemCount: controller.exerciseModels.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.onSelectExercise(index);
                          },
                          child: Stack(
                            children: [
                              CustomCard(
                                photoUrl: controller
                                        .exerciseModels[index].exercisePhoto ??
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnxL_hu4jflVBvj-Cs8LEC52L_e7y9PjySxg&s",
                                title:
                                    "${controller.exerciseModels[index].exerciseName}",
                                // content1:
                                //     "${"txt_tag".tr}: ${controller.exerciseModels[index].tagName}",
                                content2:
                                    "METs: ${controller.exerciseModels[index].met}",
                                onTitleTap: () {
                                  controller.goToExerciseDetails(controller
                                      .exerciseModels[index].exerciseID);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
