import 'package:bmi_tracker_mb_advisor/screens/plan_detail/controller/plan_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PlanDetailScreen extends GetView<PlanDetailsController> {
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
        backgroundColor: Color.fromARGB(255, 136, 212, 241),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanDetailItemWidget(
              label: 'Plan Name',
              value: controller.planModel.value.planName,
            ),
            PlanDetailItemWidget(
              label: 'Price',
              value:
                  '${controller.planModel.value.price?.round().formatWithThousandSeparator()} VND',
            ),
            const Divider(
              color: Color.fromARGB(255, 112, 105, 105),
            ),
            PlanDetailItemWidget(
              label: 'Description',
              value: controller.planModel.value.description,
            ),
            PlanDetailItemWidget(
              label: 'Plan Duration',
              value: '${controller.planModel.value.planDuration} days',
            ),
            PlanDetailItemWidget(
              label: 'Number Of Uses',
              value: '${controller.planModel.value.numberOfUses}',
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
          Text(
            value ?? '',
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
