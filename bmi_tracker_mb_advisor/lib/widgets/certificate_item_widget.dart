import 'package:bmi_tracker_mb_advisor/screens/certificate/controller/certificate_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/num_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/app_export.dart';

// ignore: must_be_immutable
class CertificateItemWidget extends StatelessWidget {
  CertificateItemWidget(
    this.index, {
    Key? key,
  }) : super(
          key: key,
        );

  int index;

  var controller = Get.find<CertificateController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // controller.goToCertificateDetail(index);
        // Get.to(PlanDetailScreen());
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
                    Image(image: AssetImage('assets/images/certificate.png')),
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
                        "Certificate Name",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${controller.certificateModel[index].certificateName}",
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
                        "Link",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Uri phoneUrl = Uri(
                      //   scheme: 'tel',
                      //   path:
                      //       '${controller.certificateModel[index].certificateLink}',
                      // );
                      launchUrl(Uri.parse(
                          controller.certificateModel[index].certificateLink!));
                    },
                    child: Text(
                      'View Link',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.h),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Opacity(
            //         opacity: 1,
            //         child: Text(
            //           "Number Of Uses",
            //           style: Theme.of(context).textTheme.bodyLarge,
            //         ),
            //       ),
            //       Obx(
            //         () => Text(
            //           "${controller.packageModel[index].numberOfUses}",
            //           style: Theme.of(context).textTheme.bodySmall,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 1.v),
          ],
        ),
      ),
    );
  }
}
