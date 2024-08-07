import 'package:bmi_tracker_mb_advisor/screens/food_detail/controller/food_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/dish_info.dart';

class FoodDetailScreen extends GetView<FoodDetailsController> {
  const FoodDetailScreen({super.key});

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
            'txt_food_details'.tr,
            style: theme.textTheme.titleLarge,
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       controller.goToFeedBack();
          //     },
          //     icon: const Icon(
          //       Icons.feedback,
          //     ),
          //   ),
          // ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Container(
                    width: double.infinity,
                    height: 180.v,
                    margin: EdgeInsets.symmetric(vertical: 10.v),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(controller
                                .foodModel.value.foodPhoto ??
                            'https://i.ytimg.com/vi/XowvxiGYsRI/maxresdefault.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                //! Name
                Text(
                  controller.foodModel.value.foodName ?? "Food name",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.v),
                  child: DishInfo(
                    kcal: "${controller.foodModel.value.foodCalories}",
                    servings: "${controller.foodModel.value.serving} serving",
                    time:
                        "${controller.foodModel.value.foodTimeProcess} ${"txt_min".tr}",
                  ),
                ),
                Text(
                  'txt_description'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.v),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      controller.foodModel.value.description ??
                          'This is the notes!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),

                // Danh sách tag của food
                Obx(
                  () => Wrap(
                    spacing: 8.0,
                    // Khoảng cách giữa các tag theo chiều ngang
                    runSpacing: 4.0,
                    // Khoảng cách giữa các dòng tag
                    children: controller.foodModel.value.foodTags!.map((tag) {
                      return Chip(
                        label: Text(tag.tagName ?? 'Unknown'),
                        backgroundColor: Color.fromARGB(255, 194, 241, 140),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  'txt_nutrition'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.v),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "carbs:${controller.foodModel.value.carbs} g, "
                      "protein:${controller.foodModel.value.protein} g,"
                      " fat:${controller.foodModel.value.fat} g",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      'txt_link_processing_video'.tr,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        launchUrl(
                            Uri.parse(controller.foodModel.value.foodVideo!));
                        // Uri.parse(
                        //     'https://www.youtube.com/watch?v=OQpMvcvmxx0'));
                      },
                      child: Text(
                        'txt_video_link'.tr,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).primaryColor,
                              // fontSize: FontStyle.italic,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'txt_ingredients'.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                    itemCount: controller.foodModel.value.recipes!.length,
                    // itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 300.v,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(255, 230, 250, 208),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: ShapeDecoration(
                                    // color:
                                    //     Color.fromARGB(255, 194, 241, 140),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      controller.foodModel.value.recipes![index]
                                              .ingredientPhoto ??
                                          "https://firebasestorage.googleapis.com/v0/b/test-ultilites.appspot.com/o/applepie.jpg?alt=media&token=a567920b-58b2-4bb8-8ea7-f59a54c5326d",
                                      height: 65.adaptSize,
                                      width: 70.adaptSize,
                                      fit: BoxFit.cover,
                                      // centerSlice: Rect.fromCircle(center: Offset.fromDirection(1.0), radius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 130.h,
                                  child: Text(
                                    "${controller.foodModel.value.recipes![index].ingredientName}",
                                    // "Ingredient Name",
                                    maxLines: 5,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 75.h,
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 4.v),
                              child: Column(
                                children: [
                                  Text(
                                    "${controller.foodModel.value.recipes![index].quantity}",
                                    // "2",
                                  ),
                                  Text(
                                    "${controller.foodModel.value.recipes![index].unit}",
                                    // "20g",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
