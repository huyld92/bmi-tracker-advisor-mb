import 'package:bmi_tracker_mb_advisor/screens/commission/controller/commission_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';

import '../util/app_export.dart';

// ignore: must_be_immutable
class CommissionItemWidget extends StatelessWidget {
  CommissionItemWidget(
    this.index, {
    Key? key,
  }) : super(
          key: key,
        );

  int index;

  var controller = Get.find<CommisionController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToCommissionDetails(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.v),
        decoration: ShapeDecoration(
          color: Color.fromARGB(255, 197, 214, 248),
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
                    Image(image: AssetImage('assets/images/comission.png')),
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
                child: Obx(
                  () => Text(
                    controller.commissionModels[index].expectedPaymentDate!
                        .format(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
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
                        "Status",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${controller.commissionModels[index].paymentStatus}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
                  Obx(
                    () => Text(
                      "${controller.commissionModels[index].commissionAmount?.round().formatWithThousandSeparator()} VND",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
