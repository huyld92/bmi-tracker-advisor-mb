import 'package:bmi_tracker_mb_advisor/models/statistics_daily_record_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_calories/controller/statistics_calories_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../util/app_export.dart';

class StatisticsCaloriesScreen extends GetView<StatisticsCaloriesController> {
  const StatisticsCaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltip = TooltipBehavior(enable: true);
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
          title: Text("txt_statistics_calories".tr,
              style: theme.textTheme.titleLarge),
        ),
        body: Obx(() {
          if (controller.dailyRecordModels.isEmpty) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/not_found.png",
                      width: 128.adaptSize),
                  Text("${"txt_not_enough_data_available_yet".tr}.",
                      style: CustomTextStyles.titleMedium16Black),
                  // Text("body_no_results".tr, style: theme.textTheme.bodyMedium,)
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "txt_last_7_days".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "${"txt_average_calories_in".tr}: ",
                                style: CustomTextStyles.bodyMedium16,
                                children: [
                                  TextSpan(
                                      text:
                                          "${controller.averageCaloriesIn} kcal",
                                      style:
                                          CustomTextStyles.bodyMedium16Green500)
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: "${"txt_average_calories_out".tr}: ",
                                style: CustomTextStyles.bodyMedium16,
                                children: [
                                  TextSpan(
                                      text:
                                          "${controller.averageCaloriesOut} kcal",
                                      style: CustomTextStyles
                                          .bodyMedium16Orange500)
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: "${"txt_goal".tr}: ",
                                style: CustomTextStyles.bodyMedium16,
                                children: [
                                  TextSpan(
                                      text: "${controller.goalCalories} kcal",
                                      style:
                                          CustomTextStyles.bodyMedium16BlueA700)
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // biểu đồ calories in, out
                  Expanded(
                    flex: 7,
                    child: Obx(
                      () => SfCartesianChart(
                        primaryXAxis: const CategoryAxis(),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum:
                              controller.dailyRecordModels[0].defaultCalories! +
                                  1000,
                          interval: 500,
                        ),
                        tooltipBehavior: tooltip,
                        series: <CartesianSeries<StatisticsDailyRecordModel,
                            String>>[
                          ColumnSeries<StatisticsDailyRecordModel, String>(
                            dataSource: controller.dailyRecordModels,
                            xValueMapper:
                                (StatisticsDailyRecordModel data, _) =>
                                    data.date!.format("dd-MM"),
                            yValueMapper:
                                (StatisticsDailyRecordModel data, _) =>
                                    data.totalCaloriesIn,
                            name: 'txt_calories_in'.tr,
                            color: appTheme.green500,
                          ),
                          ColumnSeries<StatisticsDailyRecordModel, String>(
                            dataSource: controller.dailyRecordModels,
                            xValueMapper:
                                (StatisticsDailyRecordModel data, _) =>
                                    data.date!.format("MM-dd"),
                            yValueMapper:
                                (StatisticsDailyRecordModel data, _) =>
                                    data.totalCaloriesOut,
                            name: 'txt_calories_out'.tr,
                            color: appTheme.orange500,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text("${"txt_history".tr}:",
                      style: Theme.of(context).textTheme.headlineMedium),
                  // danh sách calories in, out
                  Expanded(
                    flex: 5,
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.dailyRecordModels.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  child: HistoryItem(
                                      date: controller
                                          .dailyRecordModels[index].date!
                                          .format("dd-MM"),
                                      caloriesIn: controller
                                          .dailyRecordModels[index]
                                          .totalCaloriesIn!
                                          .formatWithThousandSeparator(),
                                      caloriesOut: controller
                                          .dailyRecordModels[index]
                                          .totalCaloriesOut!
                                          .formatWithThousandSeparator()),
                                ),
                                const Divider()
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      );
    });
  }
}

class HistoryItem extends StatelessWidget {
  final String date;
  final String caloriesIn;
  final String caloriesOut;

  const HistoryItem(
      {super.key,
      required this.date,
      required this.caloriesIn,
      required this.caloriesOut});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(date, style: CustomTextStyles.bodyMedium16),
          const Spacer(),
          Column(
            children: [
              Text("+ $caloriesIn kcal",
                  style: CustomTextStyles.bodyMedium16Green500),
              Text("- $caloriesOut kcal",
                  style: CustomTextStyles.bodyMedium16Orange500),
            ],
          )
        ],
      ),
    );
  }
}
