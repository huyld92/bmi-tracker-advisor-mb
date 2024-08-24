import 'package:bmi_tracker_mb_advisor/screens/commission/model/commission_model.dart';
import 'package:bmi_tracker_mb_advisor/screens/commission_detail/controller/commission_detail_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';

import '../../util/app_export.dart';

class CommissionDetailsScreen extends GetView<CommissionDetailsController> {
  const CommissionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Commission Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 197, 214, 248),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommissionDetailsItem(
              label: 'Expected Payment Date',
              value: controller.commissionModels.value.expectedPaymentDate!
                  .format(),
              // 'SubscriptionDate',
            ),
            CommissionDetailsItem(
                label: 'Amount',
                value:
                    '${controller.commissionModels.value.commissionAmount?.round().formatWithThousandSeparator()} VND'),
            const Divider(
              color: Color.fromARGB(255, 112, 105, 105),
            ),
            CommissionDetailsItem(
                label: 'Status',
                value: controller.commissionModels.value.paymentStatus),
            CommissionDetailsItem(
                label: 'Paid Amount',
                value:
                    '${controller.commissionModels.value.paidAmount?.round().formatWithThousandSeparator()} VND'),
            CommissionDetailsItem(
                label: 'Paid Date',
                value: controller.commissionModels.value.getPaidDate()),
            CommissionDetailsItem(
                label: 'Description',
                value: controller.commissionModels.value.commissionDescription
                    .toString()),
          ],
        ),
      ),
    );
  }
}

class CommissionDetailsItem extends StatelessWidget {
  final String? label;
  final String? value;

  const CommissionDetailsItem({super.key, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100.h,
            child: Text(
              label!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Text(
              value ?? '',
              style: TextStyle(fontSize: 15.fSize),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          )
        ],
      ),
    );
  }
}
