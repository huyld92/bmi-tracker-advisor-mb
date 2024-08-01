import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import 'controller/assign_menu_controller.dart';

class AssignMenuScreen extends GetView<AssignMenuController> {
  const AssignMenuScreen({super.key});

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
        backgroundColor: appTheme.grey100,
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () => Get.back(),
          //     icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text('title_appbar_assign_menu'.tr,
              style: theme.textTheme.titleLarge),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${"txt_total".tr} (${controller.menus.length})"),
                    const Spacer(),
                    Text("txt_sort_by".tr),
                  ],
                ),
              ),
              Expanded(
                  flex: 15,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.menus.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.goToMenuDetails(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 10.v),
                            margin: EdgeInsets.only(bottom: 10.v),
                            decoration: BoxDecoration(
                              color: appTheme.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.adaptSize)),
                              boxShadow: [
                                BoxShadow(
                                  color: appTheme.grey300,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${controller.menus[index].menuName}",
                                          style: theme.textTheme.titleLarge),
                                      Text(
                                        "${controller.menus[index].totalCalories} kcal",
                                        style:
                                            CustomTextStyles.bodyMedium14Green,
                                      ),
                                      Text(
                                        "${controller.menus[index].menuDescription}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      Obx(
                                        () => Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 5.h),
                                              child: Icon(
                                                Icons.circle,
                                                size: 16.adaptSize,
                                                color: controller
                                                        .menus[index].isActive!
                                                    ? appTheme.green500
                                                    : appTheme.red500,
                                              ),
                                            ),
                                            Obx(() {
                                              if (controller
                                                  .menus[index].isActive!) {
                                                return Text(
                                                  "Active",
                                                  style: CustomTextStyles
                                                      .bodyMedium14Green,
                                                );
                                              } else {
                                                return Text(
                                                  "Inactive",
                                                  style: CustomTextStyles
                                                      .bodyMedium14Red,
                                                );
                                              }
                                            })
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: TextButton(
                                    onPressed: () {
                                      controller.assignMenu(index);
                                    },
                                    child: Text(
                                      "txt_assign".tr,
                                      style: CustomTextStyles.linkTextStyle14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
