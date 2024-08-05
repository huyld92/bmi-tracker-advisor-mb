import 'package:bmi_tracker_mb_advisor/screens/subscription_history_detail/controller/subscription_history_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';

class SubscriptionDetailsScreen
    extends GetView<SubscriptionHistoryDetailsController> {
  const SubscriptionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscription Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 230, 250, 208),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriptionDetailItem(
              label: 'Subscription Date',
              value: controller.subscriptionModel.value.getSubscriptionDate(),
              // 'SubscriptionDate',
            ),
            SubscriptionDetailItem(
                label: 'Amount',
                value:
                    '${controller.subscriptionModel.value.amount?.round().formatWithThousandSeparator()} VND'),
            const Divider(
              color: Color.fromARGB(255, 112, 105, 105),
            ),
            SubscriptionDetailItem(
                label: 'Subscription Number',
                value: controller.subscriptionModel.value.subscriptionNumber),
            SubscriptionDetailItem(
              label: 'Description',
              value: controller.subscriptionModel.value.subscriptionDescription,
            ),
            SubscriptionDetailItem(
                label: 'Start Date',
                value: controller.subscriptionModel.value.getStartDate()),
            SubscriptionDetailItem(
                label: 'End Date',
                value: controller.subscriptionModel.value.getEndDate()),
            SubscriptionDetailItem(
                label: 'Member Name',
                value:
                    controller.subscriptionModel.value.memberName.toString()),
            SubscriptionDetailItem(
                label: 'Status',
                value: controller.subscriptionModel.value.subscriptionStatus),
          ],
        ),
      ),
    );
  }
}

class SubscriptionDetailItem extends StatelessWidget {
  final String? label;
  final String? value;

  const SubscriptionDetailItem({super.key, this.label, this.value});

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
