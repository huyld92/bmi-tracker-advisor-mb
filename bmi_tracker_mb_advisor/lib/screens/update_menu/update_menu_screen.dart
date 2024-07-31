import 'package:bmi_tracker_mb_advisor/screens/update_menu/controller/update_menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';

class UpdateMenuScreen extends GetView<UpdateMenuController> {
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
          // toolbarHeight: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'txt_update_menu'.tr,
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
                  controller: controller.txtMenuNameController,
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
              FocusScope.of(context).unfocus();
              controller.updateMenuInformation();
            },
            child: Text(
              "txt_update".tr,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
