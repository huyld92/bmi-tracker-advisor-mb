import 'package:bmi_tracker_mb_advisor/screens/statistics_weight/controller/statistics_weight_controller.dart';
import 'package:flutter/material.dart';

import '../../util/app_export.dart';

class StatisticsWeightScreen extends GetView<StatisticsWeightController> {
  const StatisticsWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        );
      }
      return Scaffold();
    });
  }
}
