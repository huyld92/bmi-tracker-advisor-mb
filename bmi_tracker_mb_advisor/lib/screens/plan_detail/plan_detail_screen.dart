import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Plan Detail',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () => {
                    // controller.
                  },
              icon: const Icon(LineAwesomeIcons.trash)),
        ],
        backgroundColor: Color.fromARGB(255, 230, 250, 208),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanDetailItemWidget(
              label: 'Plan Name',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'Plan name',
            ),
            PlanDetailItemWidget(
              label: 'Price',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'price',
            ),
            const Divider(
              color: Color.fromARGB(255, 112, 105, 105),
            ),
            PlanDetailItemWidget(
              label: 'Description',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'The plan includes a recommended menu and exercises to achieve the best results in 30 days',
            ),
            PlanDetailItemWidget(
              label: 'Plan Duration',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  'Plan duration',
            ),
            PlanDetailItemWidget(
              label: 'Number Of Uses',
              value:
                  // controller.subscriptionModel.value.getSubscriptionDate()),
                  '5 Members',
            ),
          ],
        ),
      ),
    );
  }
}

class PlanDetailItemWidget extends StatelessWidget {
  final String? label;
  final String? value;

  const PlanDetailItemWidget({super.key, this.label, this.value});

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
