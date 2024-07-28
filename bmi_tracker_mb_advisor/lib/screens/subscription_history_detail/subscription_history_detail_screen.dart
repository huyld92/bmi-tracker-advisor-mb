import 'package:flutter/material.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
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
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'SubscriptionDate',
            ),
            SubscriptionDetailItem(
              label: 'Amount',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  '100,000 VND',
            ),
            const Divider(
              color: Color.fromARGB(255, 112, 105, 105),
            ),
            SubscriptionDetailItem(
              label: 'Subscription Number',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'Subscription Number',
            ),
            SubscriptionDetailItem(
              label: 'Description',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'Description',
            ),
            SubscriptionDetailItem(
              label: 'Start Date',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'Start Date',
            ),
            SubscriptionDetailItem(
              label: 'End Date',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'End Date',
            ),
            SubscriptionDetailItem(
              label: 'Member Name',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'Member Name',
            ),
            SubscriptionDetailItem(
              label: 'Status',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'Status',
            ),
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
          Text(
            label!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value ?? ''),
        ],
      ),
    );
  }
}
