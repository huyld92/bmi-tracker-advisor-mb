import 'package:bmi_tracker_mb_advisor/screens/menu_details/controller/menu_details_controller.dart';

import 'package:flutter/material.dart';

import '../../models/menu_food_model.dart';
import '../../util/app_export.dart';
import '../../widgets/custom_image_view.dart';

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
        backgroundColor: appTheme.grey300,
        appBar: AppBar(
          backgroundColor: appTheme.white,
          title: Obx(
            () => Text("${controller.menuFoodModel.value.menuName}".tr,
                style: theme.textTheme.headlineMedium),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.v, horizontal: 15.h),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Số cột trong GridView
              crossAxisSpacing: 10, // Khoảng cách giữa các cột
              mainAxisSpacing: 10, // Khoảng cách giữa các hàng
            ),
            itemCount: controller.menuFoodModel.value.menuFoods?.length,
            itemBuilder: (context, index) {
              Food? food =
                  controller.menuFoodModel.value.menuFoods![index].food;
              // Tạo các ô trong GridView
              return Container(
                decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(10.adaptSize))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: food?.foodPhoto,
                        height: 70.adaptSize,
                        // width: 70.adaptSize,
                        fit: BoxFit.fitWidth,
                        radius: BorderRadius.circular(5),
                      ),
                      Center(
                        child: Text("${food?.foodName}",
                            style: theme.textTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
