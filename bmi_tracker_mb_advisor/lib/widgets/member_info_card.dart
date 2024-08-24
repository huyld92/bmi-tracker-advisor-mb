import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class MemberInfoCard extends StatelessWidget {
  final String height;
  final String weight;
  final String bmi;
  final String targetWeight;

  const MemberInfoCard({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.targetWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).primaryColor.withAlpha(50),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(height, style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'txt_height'.tr,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: 1.h,
              height: 55.v,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    weight,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'txt_weight'.tr,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: 1.h,
              height: 55.v,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    targetWeight,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Target weight'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Container(
              width: 1.h,
              height: 55.v,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(bmi, style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'txt_bmi'.tr,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
