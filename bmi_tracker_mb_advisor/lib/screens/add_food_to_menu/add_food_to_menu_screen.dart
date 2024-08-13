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
        appBar: AppBar(
            title: Text(
              "txt_add_food_to_menu".tr,
              style: theme.textTheme.titleLarge,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => {controller.goToCreateRequest()},
                  icon: const Icon(Icons.add_circle)),
            ]),
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
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(8.0),
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
              // search box
              Container(
                height: 40.v,
                width: double.maxFinite,
                margin: EdgeInsets.only(bottom: 10.v),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '${"txt_search".tr}...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (value) {
                          controller.searchFoodName(value);
                        },
                      ),
                    ),
                    // sort
                    Container(
                      margin: EdgeInsets.only(left: 5.h),
                      child: DropdownButton<String>(
                        value: controller.currentSortCriteria.value,
                        onChanged: (String? newValue) {
                          controller.sortFood(newValue);
                        },
                        items: <String>[
                          'Sort Ascending',
                          'Sort Descending',
                          'Sort Newest',
                          'Sort Oldest',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        // Remove the underline
                        underline: const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
              ),
              // gridview food
              Obx(() {
                if (controller.foodUIModels.isNotEmpty) {
                  return Expanded(
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
                          itemCount: controller.foodUIModels.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.onSelectFood(index);
                              },
                              child: Stack(
                                children: [
                                  CustomCard(
                                    photoUrl: controller
                                            .foodUIModels[index].foodPhoto ??
                                        "https://i.ytimg.com/vi/XowvxiGYsRI/maxresdefault.jpg",
                                    title:
                                        "${controller.foodUIModels[index].foodName}",
                                    content1:
                                        "Time: ${controller.foodUIModels[index].foodTimeProcess} min",
                                    // content2:
                                    //     "${controller.foodModels[index].serving}",
                                    content3:
                                        "${controller.foodUIModels[index].foodCalories} kcal",
                                    onTitleTap: () {
                                      controller.goToFoodDetails(controller
                                          .foodUIModels[index].foodID);
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
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off,
                              size: 50.adaptSize, color: Colors.grey),
                          SizedBox(height: 10.v),
                          Text(
                            'txt_no_results_found'.tr,
                            style: CustomTextStyles.bodyMedium16Grey500,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
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
    });
  }
}
