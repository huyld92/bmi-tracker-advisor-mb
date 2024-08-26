import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/screens/member/controller/member_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/member_card.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

class MemberScreen extends GetView<MemberController> {
  const MemberScreen({super.key});

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

      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffe9e7f2),
            toolbarHeight: 120.h,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Text(
                    'title_member_screen'.tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: 200.h,
                decoration: const BoxDecoration(
                  color: Color(0xffe9e7f2),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(70),
                  ),
                ),
              ),
              Obx(() {
                if (controller.members.isEmpty) {
                  return SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/not_found.png",
                            width: 128.adaptSize),
                        Text("${"txt_no_results_found".tr}.",
                            style: CustomTextStyles.titleMedium16Black),
                        Text(
                          "body_no_results".tr,
                          style: theme.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      // Call your refresh function here
                      await controller.refreshData();
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.members.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                            children: [
                              MemberCard(
                                member: controller.members[index],
                                isActive: true,
                                onDetailClick: () {
                                  controller.goToMemberDetails(index);
                                },
                                onMessageClick: () {
                                  log('message clicked');
                                },
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ],
          ),
          floatingActionButton: Stack(children: [
            FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: appTheme.green500,
              onPressed: () {
                controller.goToMessagesScreen();
              },
              child: Icon(Icons.message,
                  size: 30.adaptSize, color: appTheme.white),
            ),
            Positioned(
              left: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: appTheme.red500),
                child: Center(
                  child: Text(
                    "${controller.unreadMessage.value}",
                    style: CustomTextStyles.bodyMedium14White,
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
