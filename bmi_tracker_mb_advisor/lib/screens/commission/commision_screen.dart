import 'package:bmi_tracker_mb_advisor/screens/commission/controller/commission_controller.dart';

import 'package:flutter/material.dart';

import '../../util/app_export.dart';
import '../../widgets/commision_item_widget.dart';

class CommisionScreen extends GetView<CommisionController> {
  const CommisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Check the loading state
      if (controller.isLoading.value) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(1),
          body: const Center(
            child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.lightGreenAccent),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Commission',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.commissionModels.isEmpty) {
            return const Center(
              child: Text('No commission found.'),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  left: 15.h, top: 10.v, right: 15.h, bottom: 20.v),
              child: Obx(
                () => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.v);
                  },
                  itemCount: controller.commissionModels.length,
                  itemBuilder: (context, index) {
                    return CommissionItemWidget(index);
                  },
                ),
              ),
            );
          }
        }),
      );
    });
  }
}
