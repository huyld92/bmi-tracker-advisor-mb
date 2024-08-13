import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'controller/package_details_controller.dart';

class PackageDetailScreen extends GetView<PackageDetailsController> {
  const PackageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Package Detail',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () => {
                    // controller.
                  },
              icon: const Icon(LineAwesomeIcons.trash)),
        ],
        // backgroundColor: Color.fromARGB(255, 136, 212, 241),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanDetailItemWidget(
              label: 'Package Name',
              value: controller.packageModel.value.packageName,
            ),
            PlanDetailItemWidget(
              label: 'Price',
              value:
                  '${controller.packageModel.value.price?.round().formatWithThousandSeparator()} VND',
            ),
            const Divider(
              color: Color.fromARGB(255, 112, 105, 105),
            ),
            PlanDetailItemWidget(
              label: 'Description',
              value: controller.packageModel.value.description,
            ),
            PlanDetailItemWidget(
              label: 'Package Duration',
              value: '${controller.packageModel.value.packageDuration} days',
            ),
            PlanDetailItemWidget(
              label: 'Number Of Uses',
              value: '${controller.packageModel.value.numberOfUses}',
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
