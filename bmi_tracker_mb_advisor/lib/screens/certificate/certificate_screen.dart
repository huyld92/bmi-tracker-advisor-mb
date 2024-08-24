import 'package:bmi_tracker_mb_advisor/screens/certificate/controller/certificate_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/certificate_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Scaffold(
            backgroundColor: appTheme.white,
            body: Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(appTheme.green500),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'My Certificate',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Obx(() {
            if (controller.certificateModel.isEmpty) {
              return const Center(
                child: Text('No Certificate found.'),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(
                    left: 15.h, top: 10.v, right: 15.h, bottom: 20.v),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.v);
                  },
                  itemCount: controller.certificateModel.length,
                  // itemCount: 5,
                  itemBuilder: (context, index) {
                    return CertificateItemWidget(index);
                  },
                ),
              );
            }
          }),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Color.fromARGB(255, 104, 127, 142),
            onPressed: () {
              // controller.goToCreateBlog();
              // controller.goToCreateRequest();
              controller.goToCreateCertificate();
            },
            child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
          ),
        );
      },
    );
  }
}
