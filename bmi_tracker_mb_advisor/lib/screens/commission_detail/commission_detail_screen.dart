import 'package:bmi_tracker_mb_advisor/models/commission_allocation_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/commission/model/commission_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/commission_detail/controller/commission_detail_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/commission_detail/widget/commission_details_item.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';

import '../../util/app_export.dart';

class CommissionDetailsScreen extends GetView<CommissionDetailsController> {
  const CommissionDetailsScreen({super.key});

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
          title: const Text(
            'Commission Details',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommissionDetailsItem(
                label: 'Expected Payment Date',
                value: controller.commissionModel.value.expectedPaymentDate!
                    .format(),
                // 'SubscriptionDate',
              ),
              CommissionDetailsItem(
                  label: 'Amount',
                  value:
                      '${controller.commissionModel.value.commissionAmount?.round().formatWithThousandSeparator()} VND'),
              const Divider(
                color: Color.fromARGB(255, 112, 105, 105),
              ),
              CommissionDetailsItem(
                  label: 'Status',
                  value: controller.commissionModel.value.paymentStatus),
              CommissionDetailsItem(
                  label: 'Paid Amount',
                  value:
                      '${controller.commissionModel.value.paidAmount?.round().formatWithThousandSeparator()} VND'),
              CommissionDetailsItem(
                  label: 'Paid Date',
                  value: controller.commissionModel.value.getPaidDate()),
              CommissionDetailsItem(
                  label: 'Description',
                  value: controller.commissionModel.value.commissionDescription
                      .toString()),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(columnSpacing: 15.h,
                    columns: const [
                      DataColumn(label: Text('Amount')),
                       DataColumn(label: Text('Milestone')),
                      DataColumn(label: Text('Milestone Date')),
                      DataColumn(label: Text('Subscription Number')),
                    ],
                    rows: controller.commissionAllocations.map((commission) {
                      return DataRow(cells: [
                        DataCell(Text("${commission.amount!.formatWithThousandSeparator()} VND")),
                        DataCell(Text(commission.milestone!)),
                        DataCell(Text(commission.milestoneDate!.format())),
                        DataCell(Text(commission.subscriptionNumber!)),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
