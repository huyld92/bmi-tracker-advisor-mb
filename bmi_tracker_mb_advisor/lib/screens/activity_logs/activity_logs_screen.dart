import 'package:bmi_tracker_mb_advisor/screens/activity_logs/controller/activity_logs_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class ActivityLogsScreen extends GetView<ActivityLogsController> {
  const ActivityLogsScreen({super.key});

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
        appBar: AppBar(
          title: Text("Exercise logs".tr, style: theme.textTheme.titleLarge),
          actions: [
            IconButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate:
                      DateTime.parse(controller.date.value) ?? DateTime.now(),
                  firstDate: DateTime.parse("2023-05-01"),
                  lastDate: DateTime.now(),
                );
                if (picked != null &&
                    picked != DateTime.parse(controller.date.value)) {
                  controller.onDatePicker(picked);
                }
              },
              icon: Icon(Icons.calendar_month),
            )
          ],
        ),
        body: Obx(() {
          if (controller.activityLogModels.isEmpty) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/not_found.png",
                      width: 128.adaptSize),
                  Text("${"txt_no_results_found".tr}.",
                      style: CustomTextStyles.titleMedium16Black),
                  // Text("body_no_results".tr, style: theme.textTheme.bodyMedium,)
                ],
              ),
            );
          } else {
            return Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Obx(
                    () => Center(
                        child: Text("Date: ${controller.date}",
                            style: CustomTextStyles.bodyMedium16)),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.activityLogModels.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10.v),
                            child: ActivityItem(
                                // emoji: controller.activityLogModels[index].emoji,
                                name:
                                    "${controller.activityLogModels[index].activityName} ",
                                duration:
                                    "${controller.activityLogModels[index].duration} min",
                                kcal:
                                    "${controller.activityLogModels[index].caloriesBurned} kcal"),
                          );
                        }),
                  ),
                ),
              ],
            );
          }
        }),
      );
    });
  }
}

class ActivityItem extends StatelessWidget {
  final String? emoji;
  final String name;
  final String duration;
  final String kcal;

  const ActivityItem({
    super.key,
    this.emoji,
    required this.name,
    required this.duration,
    required this.kcal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          emoji ?? '',
          style: TextStyle(fontSize: 30.fSize),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 240.h,
              child: Text(name, style: CustomTextStyles.titleMedium16Black),
            ),
            Text(duration, style: CustomTextStyles.bodyMedium16),
          ],
        ),
        Text(kcal, style: CustomTextStyles.bodyMedium16),
      ],
    );
    // return ListTile(
    //   leading: icon != null
    //       ? Icon(icon, size: 30)
    //       : Text(
    //     emoji ?? '',
    //     style: const TextStyle(fontSize: 30),
    //   ),
    //   title: Text(name, style: CustomTextStyles.titleMedium16Black),
    //   subtitle: Text(duration, style: CustomTextStyles.bodyMedium16),
    //   trailing: Text(kcal, style: CustomTextStyles.bodyMedium16),
    //   onTap: () {
    //     // Add tile tap functionality here
    //   },
    // );
  }
}
