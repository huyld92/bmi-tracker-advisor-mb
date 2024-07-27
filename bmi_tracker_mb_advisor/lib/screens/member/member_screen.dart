import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/screens/member/controller/member_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/member_card.dart';
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
                        Text("body_no_results".tr, style: theme.textTheme.bodyMedium,)
                      ],
                    ),
                  );
                } else {
                  return Obx(
                    () => ListView.builder(
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         CometChatConversationsWithMessages(
                                  //       conversationsConfiguration:
                                  //           ConversationsConfiguration(
                                  //         backButton: IconButton(
                                  //           onPressed: () {
                                  //             controller.getBack();
                                  //           },
                                  //           icon:
                                  //               const Icon(Icons.arrow_back_ios_new),
                                  //         ),
                                  //       ),
                                  //       // user: User.fromUID(
                                  //       //   uid: controller
                                  //       //       .memberList[index].memberID
                                  //       //       .toString(),
                                  //       //   name: controller
                                  //       //       .memberList[index].fullName,
                                  //       // ),
                                  //     ),
                                  //   ),
                                  // );
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
        ),
      );
    });
  }
}
