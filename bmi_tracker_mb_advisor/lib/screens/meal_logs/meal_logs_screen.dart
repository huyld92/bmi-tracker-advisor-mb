import 'package:bmi_tracker_mb_advisor/screens/meal_logs/controller/meal_logs_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MealLogsScreen extends GetView<MealLogsController> {
  const MealLogsScreen({super.key});

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
          title:
              Text("txt_meal_logs".tr, style: theme.textTheme.titleLarge),
          actions: [
            IconButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate:
                      DateTimeExtension.parseWithFormat(controller.date.value),
                  firstDate: DateTimeExtension.parseWithFormat("2024-01-01"),
                  lastDate: DateTime.now(),
                );
                if (picked != null &&
                    picked !=
                        DateTimeExtension.parseWithFormat(
                            controller.date.value)) {
                  controller.onDatePicker(picked);
                }
              },
              icon: Icon(Icons.calendar_month),
            )
          ],
        ),
        body: Obx(() {
          if (controller.mealLogModels.isEmpty) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.mealLogModels.length,
                        itemBuilder: (context, index) {
                          var mealLog = controller.mealLogModels[index];
                          return Column(
                            children: [
                              MealLogItem(
                                name: mealLog.foodName ?? "Honey",
                                mealType: mealLog.mealType ?? "",
                                quantity:
                                    '${mealLog.quantity} - ${mealLog.unit} serving',
                                kcal: mealLog.calories.toString(),
                              ),
                              const Divider()
                            ],
                          );
                        },
                      ),
                    ),
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

class MealLogItem extends StatelessWidget {
  final String name;
  final String mealType;
  final String quantity;
  final String kcal;

  const MealLogItem(
      {super.key,
      required this.name,
      required this.mealType,
      required this.quantity,
      required this.kcal});

  // var controller = Get.find<MealLogsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: CustomTextStyles.titleMedium16Black),
            Text(
              mealType,
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              "Quantity: $quantity",
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        const Spacer(),
        Text(
          "$kcal kcal",
          style: theme.textTheme.bodyMedium,
        )
      ],
    );
  }
}
