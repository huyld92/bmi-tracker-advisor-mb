import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/subscription_item_widget.dart';

class SubscriptionHistoryScreen extends StatelessWidget {
  const SubscriptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscription History',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 15.h, top: 10.v, right: 15.h, bottom: 20.v),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.v);
          },
          // itemCount: controller.subscriptionModels.length,
          itemCount: 5,
          itemBuilder: (context, index) {
            return SubscriptionItemWidget(index);
          },
        ),
      ),
    );
  }
}
