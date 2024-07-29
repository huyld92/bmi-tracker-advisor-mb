import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/member_info_card.dart';
import 'package:flutter/material.dart';

import 'controller/member_details_controller.dart';

class MemberDetailsScreen extends GetView<MemberDetailsController> {
  const MemberDetailsScreen({super.key});

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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(
                          "${controller.member.value.accountPhoto}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                '${controller.member.value.fullName}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Obx(
                              () => Text(
                                '${"txt_age".tr}: ${controller.member.value.age}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey[25]),
                              ),
                            )
                          ],
                        ),
                        // Messages button
                        FilledButton(
                          onPressed: () {
                            controller.chat();
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text('Chat'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.v),
                      child: Obx(
                        () => MemberInfoCard(
                          height: controller.member.value.height.toString(),
                          weight: controller.member.value.weight.toString(),
                          bmi: controller.member.value.bmi!.round().toString(),
                        ),
                      ),
                    ),
                    Text(
                      'txt_statistics'.tr,
                      style: theme.textTheme.titleLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            // now button
                            FilledButton(
                              onPressed: () {
                                controller.goToWeightStatistics();
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: appTheme.blueA100,
                                fixedSize: Size(150.h, 100.v),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/weight-scale.png'),
                                width: 60.adaptSize,
                                height: 60.adaptSize,
                              ),
                            ),
                            Text(
                              'txt_weight_statistics'.tr,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // now button
                            FilledButton(
                              onPressed: () {
                                controller.goToCaloriesStatistics();
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: appTheme.yellow500,
                                fixedSize: Size(150.h, 100.v),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/calories.png'),
                                width: 60.adaptSize,
                                height: 60.adaptSize,
                              ),
                            ),
                            Text(
                              'txt_calories_statistics'.tr,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'txt_daily_record'.tr,
                      style: theme.textTheme.titleLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            // now button
                            FilledButton(
                              onPressed: () {
                                controller.goToMealLogs();
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: appTheme.blueA100,
                                fixedSize: Size(150.h, 100.v),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image:
                                    const AssetImage('assets/images/meal.png'),
                                width: 60.adaptSize,
                                height: 60.adaptSize,
                              ),
                            ),
                            Text(
                              'txt_meal_logs'.tr,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // now button
                            FilledButton(
                              onPressed: () {
                                controller.goToActivityLogs();
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: appTheme.yellow500,
                                fixedSize: Size(150.h, 100.v),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/activity.png'),
                                width: 60.adaptSize,
                                height: 60.adaptSize,
                              ),
                            ),
                            Text(
                              'txt_activity_logs'.tr,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'txt_customize_menu_and_Workout'.tr,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            // now button
                            FilledButton(
                              onPressed: () {
                                controller.goToMenuHistory();
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: appTheme.lightGreen200,
                                fixedSize: Size(150.v, 100.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image:
                                    const AssetImage('assets/images/menu.png'),
                                width: 60.adaptSize,
                                height: 60.adaptSize,
                              ),
                            ),
                            Text(
                              'txt_view_menu_history'.tr,
                              // 'Menu',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // now button
                            FilledButton(
                              onPressed: () {
                                controller.goToWorkoutHistory();
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: appTheme.blueA700,
                                fixedSize: Size(150.v, 100.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Image(
                                image: const AssetImage(
                                    'assets/images/workout.png'),
                                width: 60.adaptSize,
                                height: 60.adaptSize,
                              ),
                            ),
                            Text(
                              'txt_view_workout_history'.tr,
                              // "Workout",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
