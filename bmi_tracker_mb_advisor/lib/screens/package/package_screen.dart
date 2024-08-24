import 'package:bmi_tracker_mb_advisor/screens/package/controller/package_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/package_item_widget.dart';

class PackageScreen extends GetView<PackageController> {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
            'My Package',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.packageModel.isEmpty) {
            return const Center(
              child: Text('No package found.'),
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
                itemCount: controller.packageModel.length,
                // itemCount: 5,
                itemBuilder: (context, index) {
                  return PackageItemWidget(index);
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
            controller.goToCreatePackage();
          },
          child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
        ),
      );
    });
  }
}
