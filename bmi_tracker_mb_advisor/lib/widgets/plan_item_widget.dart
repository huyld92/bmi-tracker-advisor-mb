import 'package:bmi_tracker_mb_advisor/screens/plan_detail/plan_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/subscription_history_detail/subscription_history_detail_screen.dart';
import 'package:flutter/material.dart';

import '../screens/subscription_history/controller/subscription_history_controller.dart';
import '../util/app_export.dart';

// ignore: must_be_immutable
class PlanItemWidget extends StatelessWidget {
  PlanItemWidget(
    this.index, {
    Key? key,
  }) : super(
          key: key,
        );

  int index;

  // var controller = Get.find<SubscriptionHistoryController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // controller.goToSubscriptionsDetails(index);
        Get.to(PlanDetailScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.v),
        decoration: ShapeDecoration(
          color: Color.fromARGB(255, 136, 212, 241),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: const CircleAvatar(
                child:
                    // Icon(
                    //   Icons.account_balance_rounded,
                    //   color: Colors.white,
                    // ),
                    Image(image: AssetImage('assets/images/plan.png')),
                radius: 20,
                // backgroundColor: Colors.green,
              ),
              // radius: 20,
              // backgroundColor: Theme.of(context).primaryColor,
              // Text(
              //   "${controller.bookingModels[index].bookingNumber}",
              //   style: Theme.of(context).textTheme.titleMedium,
              // ),
              //   Icon( Icons.account_balance_sharp,
              //   color: Colors.green,
              //   ),
              //   radius: 20,
              // backgroundColor: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 3.v),
            Opacity(
              opacity: 0.5,
              child: Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Text(
                  // controller.subscriptionModels[index].getSubscriptionDate(),
                  'Plan Name',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 112, 105, 105),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 1,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "Duration",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Text(
                    // "${controller.subscriptionModels[index].subscriptionStatus}",
                    '30 days',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 1,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "Price",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Text(
                    // "${controller.subscriptionModels[index].advisorID}",
                    '100,000 VND',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 1,
                    child: Text(
                      "Number Of Uses",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    // "${controller.subscriptionModels[index].amount}",
                    '5 Members',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.v),
          ],
        ),
      ),
    );
  }
}
