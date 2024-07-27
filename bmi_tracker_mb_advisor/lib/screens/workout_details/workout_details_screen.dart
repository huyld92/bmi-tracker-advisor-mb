import 'package:bmi_tracker_mb_advisor/screens/workout_details/controller/workout_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
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
      return Scaffold();
    });
  }
}
