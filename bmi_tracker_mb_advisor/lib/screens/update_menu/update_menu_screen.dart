import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';

class UpdateMenuScreen extends StatelessWidget {
  const UpdateMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Update Menu',
                    style: Theme.of(context).textTheme.headlineSmall,
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
                          backgroundColor: appTheme.lightGreen200,
                          radius: 40,
                          child: Image(
                            image: AssetImage('assets/images/menu.png'),
                            width: 40.adaptSize,
                            height: 40.adaptSize,
                          )),
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
                  // controller: controller.menuNameController,
                  // validator: (value) {
                  //   return feedbackController.validateTitle(value!);
                  // },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    // hintText: 'txt_hint_menu_name'.tr,
                    hintText: 'Update menu name',
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
                TextFormField(
                  maxLines: 5,
                  // controller: controller.txtMenuDescriptionController,
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
                    // hintText: 'txt_hint_menu_description'.tr,
                    hintText: 'Update menu description',
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
                ListView.builder(
                  shrinkWrap: true,
                  // itemCount: controller.menuFoodModels.length,
                  itemCount: 3,
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
                                Text('foodname'),
                                Text('mealType',
                                    style: theme.textTheme.bodyMedium),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                // controller.removeFood(index);
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
                InkWell(
                  onTap: () {
                    // controller.goToAddFood();
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
              // controller.createNewMenu();
            },
            child: Text(
              "txt_save".tr,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
