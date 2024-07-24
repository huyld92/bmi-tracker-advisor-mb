
import 'package:flutter/material.dart';

import '../../theme/custom_text_style.dart';
import '../../util/app_export.dart';
import 'controller/menu_controller.dart';

class MenuScreen extends GetView<MenuScreenController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        );
      }
      return Scaffold(
        backgroundColor: appTheme.grey100,
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
                    Spacer(),
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
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 10.v),
                          margin: EdgeInsets.only(bottom: 10.v),
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.adaptSize)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${controller.menus[index].menuName}",
                                        style: theme.textTheme.titleLarge),
                                    Text(
                                      "${controller.menus[index].totalCalories} kcal",
                                      style: CustomTextStyles.bodyMedium13Green,
                                    ),
                                    Text(
                                      "${controller.menus[index].menuDescription}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              // const Spacer(),
                              Expanded(
                                flex: 3,
                                child: TextButton(
                                  onPressed: () {
                                    controller.goToMenuDetails(index);
                                  },
                                  child: Text(
                                    "txt_view_details".tr,
                                    style: CustomTextStyles.linkTextStyle14,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: appTheme.green500,
          onPressed: () {
            controller.floatingAddButton();
          },
          child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
        ),
      );
    });
  }
}
