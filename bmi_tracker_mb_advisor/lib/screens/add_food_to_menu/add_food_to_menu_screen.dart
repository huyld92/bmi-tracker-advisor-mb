import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

import '../../models/enums/EMealType.dart';
import '../../theme/custom_button_style.dart';
import 'controller/add_food_to_menu_controller.dart';

class AddFoodToMenuScreen extends GetView<AddFoodToMenuController> {
  const AddFoodToMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "txt_add_food_to_menu".tr,
          style: theme.textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.v),
              child: Text(
                "txt_select_meal_type".tr,
                style: CustomTextStyles.titleMedium16Black,
              ),
            ),
            Obx(() {
              // Row select meal type
              return Row(
                children: EMealType.values.map((EMealType meal) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.selectMeal(meal);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: controller.selectedMeal.value == meal
                              ? appTheme.green500
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: controller.selectedMeal.value == meal
                                ? appTheme.green500
                                : Colors.grey,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              meal.name,
                              style: controller.selectedMeal.value == meal
                                  ? CustomTextStyles.bodyMedium14White
                                  : CustomTextStyles.bodyMedium14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
            Container(
              margin: EdgeInsets.only(top: 5.v, bottom: 5.v),
              child: Text(
                "txt_select_foods".tr,
                style: CustomTextStyles.titleMedium16Black,
              ),
            ),
            // Container(
            //   height: 100.v,
            //   color: Colors.amberAccent,
            // ),
            // gridview food
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 15.v),
                child: Obx(
                  () => GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio:
                          0.7, // Adjust the aspect ratio as needed
                    ),
                    itemCount: controller.foodModels.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.onSelectFood(index);
                        },
                        child: Stack(
                          children: [
                            CustomCard(
                              photoUrl:
                                  controller.foodModels[index].foodPhoto ?? "",
                              title: "${controller.foodModels[index].foodName}",
                              content1:
                                  "${controller.foodModels[index].foodTimeProcess} min",
                              content2:
                                  "${controller.foodModels[index].serving}",
                              content3:
                                  "${controller.foodModels[index].foodCalories} kcal",
                              onTitleTap: () {
                                controller.goToFoodDetails(
                                    controller.foodModels[index].foodID);
                              },
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Obx(
                                () => Checkbox(
                                  value: controller.foodSelected[index],
                                  onChanged: (bool? value) {
                                    controller.onSelectFood(index);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 50.v,
        width: 200.h,
        child: ElevatedButton(
          style: CustomButtonStyles.outlineButtonGreen500,
          onPressed: () {
            controller.addFoodToMenu();
          },
          child: Text(
            "txt_done".tr,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
