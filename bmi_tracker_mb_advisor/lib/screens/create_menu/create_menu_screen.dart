import 'package:bmi_tracker_mb_advisor/theme/custom_button_style.dart';
import 'package:bmi_tracker_mb_advisor/theme/custom_text_style.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import 'controller/create_menu_controller.dart';

class CreateMenuScreen extends GetView<CreateMenuController> {
  const CreateMenuScreen({super.key});

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
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            toolbarHeight: 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Menu',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'create a menu suitable for your member',
                      // 'Welcome Van Tung',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
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
                  SizedBox(height: 30.v),
                  Text(
                    'txt_menu_name'.tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 1,
                    controller: controller.menuNameController,
                    // validator: (value) {
                    //   return feedbackController.validateTitle(value!);
                    // },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'txt_hint_menu_name'.tr,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    'txt_menu_description'.tr,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 5,
                    controller: controller.txtMenuDescriptionController,
                    // validator: (value) {
                    //   return feedbackController.validateTitle(value!);
                    // },

                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      hintText: 'txt_hint_menu_description'.tr,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: Text(
                      "txt_foods".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.menuFoodModels.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller
                                        .menuFoodModels[index].foodName!),
                                    Text(
                                        controller
                                            .menuFoodModels[index].mealType!,
                                        style: theme.textTheme.bodyMedium),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.removeFood(index);
                                  },
                                  icon: Icon(
                                    Icons.highlight_remove,
                                    color: appTheme.red500,
                                  ),
                                )
                              ],
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  ),
                  InkWell(
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
                  ),
                  const Divider()
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: 50.v,
            width: 200.h,
            child: ElevatedButton(
              style: CustomButtonStyles.outlineButtonGreen500,
              onPressed: () {
                controller.createNewMenu();
              },
              child: Text(
                "txt_save".tr,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      );
    });
  }
}
