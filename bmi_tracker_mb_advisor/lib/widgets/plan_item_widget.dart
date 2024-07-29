import 'package:bmi_tracker_mb_advisor/screens/plan/controller/plan_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/plan_detail/plan_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';

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

  var controller = Get.find<PlanController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToPlanDetail(index);
        // Get.to(PlanDetailScreen());
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
                child: Obx(
                  () => Text(
                    "${controller.planModel[index].planName}",
                    style: Theme.of(context).textTheme.bodySmall,
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
                        "Duration",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${controller.planModel[index].planDuration} days",
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
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "Price",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${controller.planModel[index].price?.round().formatWithThousandSeparator()} VND",
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
                      "Number Of Uses",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${controller.planModel[index].numberOfUses}",
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
