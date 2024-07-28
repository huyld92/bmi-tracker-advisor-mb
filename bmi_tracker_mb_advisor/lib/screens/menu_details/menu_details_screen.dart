import 'package:bmi_tracker_mb_advisor/screens/menu_details/controller/menu_details_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../util/app_export.dart';

class MenuDetailsScreen extends GetView<MenuDetailsController> {
  const MenuDetailsScreen({super.key});

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
          // backgroundColor: appTheme.white,
          title: Obx(
                () =>
                Text("${controller.menuDetailsModel.value.menuName}".tr,
                    style: theme.textTheme.titleLarge),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.v),
          child: Container(
            margin: EdgeInsets.only(bottom: 70.v),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(
                          Icons.food_bank_rounded,
                          size: 40.adaptSize,
                        ),
                      ),
                    ],
                  ),
                ),
                // menu information
                Container(
                  margin: EdgeInsets.only(top: 15.v),
                  padding: EdgeInsets.all(10.v),
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: appTheme.grey500,
                        // offset: Offset(0, 5),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.v),
                        child: RichText(
                          text: TextSpan(
                              text: "${"txt_total_calories".tr}: ",
                              style: theme.textTheme.titleSmall,
                              children: [
                                TextSpan(
                                  text:
                                  "${controller.menuDetailsModel.value
                                      .totalCalories} kcal",
                                  style: CustomTextStyles.bodyMedium16,
                                )
                              ]),
                        ),
                      ),
                      Obx(() {
                        if (controller.menuDetailsModel.value.menuDescription!
                            .isNotEmpty) {
                          return RichText(
                            text: TextSpan(
                                text: "${"txt_description".tr}: ",
                                style: theme.textTheme.titleSmall,
                                children: [
                                  TextSpan(
                                    text:
                                    "${controller.menuDetailsModel.value
                                        .menuDescription}",
                                    style: CustomTextStyles.bodyMedium16,
                                  )
                                ]),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      Padding(
                        padding: EdgeInsets.only(top: 10.v),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5.h),
                              child: Icon(
                                Icons.circle,
                                size: 16.adaptSize,
                                color:
                                controller.menuDetailsModel.value.isActive!
                                    ? appTheme.green500
                                    : appTheme.red500,
                              ),
                            ),
                            Obx(() {
                              if (controller.menuDetailsModel.value.isActive!) {
                                return Text(
                                  "Active",
                                  style: CustomTextStyles.bodyMedium16Green,
                                );
                              } else {
                                return Text(
                                  "Inactive",
                                  style: CustomTextStyles.bodyMedium16Red,
                                );
                              }
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //menu food information
                Container(
                  margin: EdgeInsets.only(top: 20.v, bottom: 10.v),
                  child: Text(
                    "txt_foods".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                Obx(
                      () =>
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                        controller.menuDetailsModel.value.menuFoods?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: Key(controller
                                .menuDetailsModel.value.menuFoods![index]
                                .menuFoodID
                                .toString()),
                            endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                              Obx(() {
                                if (controller.menuDetailsModel.value
                                    .menuFoods![index].isActive!) {
                                  return SlidableAction(
                                    onPressed: (context) {
                                      controller.deactivateFood(index);
                                    },
                                    backgroundColor: appTheme.red500,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'txt_deactivate'.tr,
                                  );
                                } else {
                                  return SlidableAction(
                                    onPressed: (context) {
                                      controller.activateFood(index);
                                    },
                                    backgroundColor: const Color(0xFF1FBE1B),
                                    foregroundColor: Colors.white,
                                    icon: Icons.check_circle,
                                    label: 'txt_activate'.tr,
                                  );
                                }
                              }),
                            ]),
                            child: GestureDetector(
                              onTap: () {
                                controller.goToFoodDetails(controller
                                    .menuDetailsModel
                                    .value
                                    .menuFoods![index]
                                    .foodID);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.v),
                                color: appTheme.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.menuDetailsModel.value
                                                  .menuFoods![index].foodName!,
                                              style: CustomTextStyles
                                                  .titleMedium16Black,
                                            ),
                                            Text(
                                              controller.menuDetailsModel.value
                                                  .menuFoods![index].mealType!,
                                              style: CustomTextStyles
                                                  .bodyMedium16,
                                            ),
                                            Text(
                                              "${controller.menuDetailsModel
                                                  .value.menuFoods![index]
                                                  .foodCalories!} kcal",
                                              style: CustomTextStyles
                                                  .bodyMedium16,
                                            ),
                                          ],
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(right: 5.h),
                                          child: Icon(
                                            Icons.circle,
                                            size: 16.adaptSize,
                                            color: controller.menuDetailsModel
                                                .value
                                                .menuFoods![index].isActive!
                                                ? appTheme.green500
                                                : appTheme.red500,
                                          ),
                                        ),
                                        // Obx(() {
                                        //   if (controller.menuDetailsModel.value
                                        //       .menuFoods![index].isActive!) {
                                        //     return Text(
                                        //       "Active",
                                        //       style: CustomTextStyles.bodyMedium13Green,
                                        //     );
                                        //   } else {
                                        //     return Text(
                                        //       "Inactive",
                                        //       style: CustomTextStyles.bodyMedium13Red,
                                        //     );
                                        //   }
                                        // })
                                      ],
                                    ),
                                    // const Divider()
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                ),
                Obx(() {
                  if (controller.isOwned.value) {
                    return InkWell(
                      onTap: () {
                        controller.goToAddFood();
                      },
                      child: SizedBox(
                        height: 40.v,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: appTheme.green500,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text("txt_add_food".tr,
                                  style: CustomTextStyles.bodyMediumGreen500),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  else {
                    return Container();
                  }
                }),
                const Divider()
              ],
            ),
          ),
        ),
      );
    });
  }
}
