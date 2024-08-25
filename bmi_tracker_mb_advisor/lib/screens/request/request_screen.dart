import 'package:bmi_tracker_mb_advisor/screens/request/controller/request_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/request_item_widget.dart';
import 'package:flutter/material.dart';

class RequestScreen extends GetView<RequestController> {
  const RequestScreen({super.key});

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
              'My Request',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Obx(() {
            if (controller.requestModel.isEmpty) {
              return const Center(
                child: Text('No request found.'),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  // Call your refresh function here
                  await controller.refreshData();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.h, top: 10.v, right: 15.h, bottom: 20.v),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10.v);
                    },
                    itemCount: controller.requestModel.length,
                    // itemCount: 5,
                    itemBuilder: (context, index) {
                      return RequestItemWidget(index);
                    },
                  ),
                ),
              );
            }
          }),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color.fromARGB(255, 104, 127, 142),
            onPressed: () {
              // controller.goToCreateBlog();
              controller.goToCreateRequest();
            },
            child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
          ),
        );
      },
    );
  }
}
