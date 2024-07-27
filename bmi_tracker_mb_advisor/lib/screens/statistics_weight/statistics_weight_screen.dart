import 'package:bmi_tracker_mb_advisor/models/%20statistics_bodymass_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/statistics_weight/controller/statistics_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
      return Scaffold(
        appBar: AppBar(
          title: Text("txt_statistics_weight".tr,
              style: theme.textTheme.titleLarge),
        ),
        body: Obx(() {
          if (controller.statisticsBodyMassModels.isEmpty) {
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
                            "txt_last_30_days".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "${"txt_starting_weight".tr}: ",
                                style: CustomTextStyles.bodyMedium16,
                                children: [
                                  TextSpan(
                                      text:
                                          "${controller.statisticsBodyMassModels.first.weight} kg",
                                      style:
                                          CustomTextStyles.bodyMedium16Grey300)
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: "${"txt_goal_weight".tr}: ",
                                style: CustomTextStyles.bodyMedium16,
                                children: [
                                  TextSpan(
                                      text: "${controller.goalWeight.value} kg",
                                      style:
                                          CustomTextStyles.bodyMedium16Green500)
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: "${"txt_current".tr}: ",
                                style: CustomTextStyles.bodyMedium16,
                                children: [
                                  TextSpan(
                                      text:
                                          "${controller.statisticsBodyMassModels.last.weight} kg",
                                      style:
                                          CustomTextStyles.bodyMedium16Grey300)
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // biểu đồ calories in, out
                  Expanded(
                    flex: 7,
                    child: SfCartesianChart(
                      primaryXAxis: const CategoryAxis(),
                      // Điều chỉnh khoảng cách giữa các giá trị trên trục y
                      primaryYAxis: const NumericAxis(interval: 2),
                      //Enables the tooltip for all the series
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries>[
                        LineSeries<StatisticsMemberBodyMassModel, String>(
                          dataSource: controller.statisticsBodyMassModels,
                          xValueMapper:
                              (StatisticsMemberBodyMassModel data, _) =>
                                  data.dateInput!.format("MM-dd"),
                          yValueMapper:
                              (StatisticsMemberBodyMassModel data, _) =>
                                  data.weight,
                          enableTooltip: true,
                        )
                      ],
                    ),
                  ),
                  Text("${"txt_history".tr}: ",
                      style: theme.textTheme.titleLarge),
                  // danh sách cân nặng thay đổi
                  Expanded(
                    flex: 5,
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.statisticsBodyMassModels.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                HistoryItem(
                                    date: controller
                                        .statisticsBodyMassModels[index]
                                        .dateInput!
                                        .format(),
                                    weight: controller
                                        .statisticsBodyMassModels[index]
                                        .weight!),
                                Divider()
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
  final int weight;

  const HistoryItem({
    super.key,
    required this.date,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaQuerySize.width,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(date, style: CustomTextStyles.bodyMedium16),
            const Spacer(),
            Column(
              children: [
                Text("$weight kg", style: CustomTextStyles.bodyMedium16Grey300),
              ],
            )
          ],
        ),
      ),
    );
  }
}
