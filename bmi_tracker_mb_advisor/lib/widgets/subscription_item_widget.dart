import 'package:bmi_tracker_mb_advisor/screens/subscription_history_detail/subscription_history_detail_screen.dart';
import 'package:flutter/material.dart';

import '../screens/subscription_history/controller/subscription_history_controller.dart';
import '../util/app_export.dart';

// ignore: must_be_immutable
class SubscriptionItemWidget extends StatelessWidget {
  SubscriptionItemWidget(
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
        Get.to(SubscriptionDetailsScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.v),
        decoration: ShapeDecoration(
          color: Color.fromARGB(255, 230, 250, 208),
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
                    Image(image: AssetImage('assets/images/bank.png')),
                radius: 15,
                backgroundColor: Colors.green,
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
                  'SubscriptionDate',
                  style: Theme.of(context).textTheme.bodyMedium,
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
                        "Booking status",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Text(
                    // "${controller.subscriptionModels[index].subscriptionStatus}",
                    'subscriptionStatus',
                    style: Theme.of(context).textTheme.bodySmall,
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
                        "Plan duration",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Text(
                    // "${controller.subscriptionModels[index].advisorID}",
                    'advisorID',
                    style: Theme.of(context).textTheme.bodySmall,
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
                      "Amount",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    // "${controller.subscriptionModels[index].amount}",
                    'amount',
                    style: Theme.of(context).textTheme.bodySmall,
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
