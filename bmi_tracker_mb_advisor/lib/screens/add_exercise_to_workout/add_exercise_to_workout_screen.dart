import 'package:bmi_tracker_mb_advisor/screens/add_exercise_to_workout/controller/add_exercise_to_workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_text_style.dart';

class AddExerciseToWorkoutScreen
    extends GetView<AddExerciseToWorkoutController> {
  const AddExerciseToWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "title_add_exercise_to_workout".tr,
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
                height: 40.v,
                width: double.maxFinite,
                margin: EdgeInsets.only(bottom: 10.v, top: 10.v),
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
                          controller.searchExerciseName(value);
                        },
                      ),
                    ),
                    // sort
                    Obx(
                      () => Container(
                        margin: EdgeInsets.only(left: 5.h),
                        child: DropdownButton<String>(
                          value: controller.currentSortCriteria.value,
                          onChanged: (String? newValue) {
                            controller.sortExercise(newValue);
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
                    ),
                    // // filter
                    // DropdownButton<String>(
                    //   value: controller.selectedFilter,
                    //   onChanged: (String? newValue) {
                    //     controller.filterFood(newValue);
                    //   },
                    //   items: <String>[
                    //     'All',
                    //     'Fruit',
                    //     'Vegetable',
                    //   ].map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child:  Row(
                    //         children: [
                    //           Icon(Icons.filter_alt_sharp),
                    //           SizedBox(width: 4.0), // Adjust the spacing here
                    //           Text(value),
                    //         ],
                    //       ),
                    //     );
                    //   }).toList(),
                    //   // Remove the underline
                    //   underline: const SizedBox.shrink(),
                    // ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.exerciseUIModels.isNotEmpty) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15.v),
                      child: Obx(
                        () => RefreshIndicator(
                          onRefresh: () async {
                            // Call your refresh function here
                            await controller.refreshData();
                          },
                          child: GridView.builder(
                            padding: const EdgeInsets.all(10.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio:
                                  0.7, // Adjust the aspect ratio as needed
                            ),
                            itemCount: controller.exerciseUIModels.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.onSelectExercise(index);
                                },
                                child: Stack(
                                  children: [
                                    CustomCard(
                                      photoUrl: controller
                                              .exerciseUIModels[index]
                                              .exercisePhoto ??
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnxL_hu4jflVBvj-Cs8LEC52L_e7y9PjySxg&s",
                                      title:
                                          "${controller.exerciseUIModels[index].exerciseName}",
                                      // content1:
                                      //     "${"txt_tag".tr}: ${controller.exerciseModels[index].tagName}",
                                      content2:
                                          "METs: ${controller.exerciseUIModels[index].met}",
                                      onTitleTap: () {
                                        controller.goToExerciseDetails(index);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
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
      ),
    );
  }
}
