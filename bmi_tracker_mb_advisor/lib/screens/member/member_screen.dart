import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/screens/member/member_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/member_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //   if (controller.isLoading.value) {
    //       return const Center(
    //         child: CircularProgressIndicator.adaptive(
    //             backgroundColor: Colors.transparent),
    //       );
    //     }
    // }

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
                  'Members had Subscription',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 15),
              //   child: CustomTextFormField(
              //     fillColor: Colors.white,
              //     borderRadius: 0,
              //     prefixicon: const Icon(Icons.search),
              //     hintTxt: 'Search your trainer',
              //   ),
              // ),
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
            ListView.builder(
              shrinkWrap: true,
              // itemCount: controller.memberList.length,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Column(
                    children: [
                      MemberCard(
                        // member: controller.memberList[index],
                        // member: member,
                        isActive: true,
                        // isBooking: controller.isBooking.value,
                        // onBlogClick: () {
                        //   controller.goToBlogScreen(index);
                        // },
                        onDetailClick: () {
                          log('Detail clicked');
                          Get.to(MemberDetailsScreen());
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
                        // onBookClick: () {
                        //   controller.goToChoosePlan(index);
                        // },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
