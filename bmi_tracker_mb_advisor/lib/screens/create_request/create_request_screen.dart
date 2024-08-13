import 'package:bmi_tracker_mb_advisor/models/enums/enum_user_request.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';
import '../../util/app_export.dart';
import 'controller/create_request_controller.dart';

class CreateRequestScreen extends GetView<CreateRequestController> {
  const CreateRequestScreen({super.key});

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
            toolbarHeight: 60.v,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title_appbar_create_request'.tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0.v),
            child: Container(
              margin: EdgeInsets.only(bottom: 80.v),
              child: Form(
                key: controller.createRequestFormKey,
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
                              image:
                                  const AssetImage('assets/images/request.png'),
                              width: 40.adaptSize,
                              height: 40.adaptSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'txt_type'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.v),
                    Container(
                        width: 170.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        //! type
                        child: DropdownButton<String>(
                          value: controller.requestType.value,
                          onChanged: (String? newValue) {
                            controller.selectType(newValue);
                          },
                          items: controller.dropDownType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )),
                    Obx(() {
                      if (controller.requestType.value ==
                          EUserRequestType.CREATE_FOOD.name) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.v),
                            Text(
                              'txt_food_name'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.v),
                            TextFormField(
                              maxLines: 1,
                              controller: controller.txtFoodNameController,
                              onSaved: (value) {
                                // controller.purpose = value!;
                              },
                              validator: (value) {
                                return controller.validatePurpose(value!);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'txt_enter_food_name'.tr,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.0),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
                    SizedBox(height: 10.v),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.h),
                          child: Text(
                            'txt_purpose'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tooltip(
                            message: controller.purposeToolTip,
                            margin: EdgeInsets.symmetric(horizontal: 80.h),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: appTheme.white,
                            ),
                            // verticalOffset: 5,
                            textStyle: CustomTextStyles.bodyMedium14,
                            // richMessage: TextSpan(text: "aa"),
                            triggerMode: TooltipTriggerMode.tap,
                            showDuration: const Duration(seconds: 4),
                            child: CircleAvatar(
                              radius: 10.adaptSize,
                              backgroundColor: appTheme.grey300,
                              child: Icon(
                                Icons.question_mark,
                                color: Colors.white,
                                size: 15.adaptSize,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 10.v),
                    TextFormField(
                      maxLines: 5,
                      controller: controller.txtPurposeController,
                      onSaved: (value) {
                        // controller.purpose = value!;
                      },
                      validator: (value) {
                        return controller.validatePurpose(value!);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'txt_enter_your_purpose'.tr,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.0),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10.v),
                  ],
                ),
              ),
            ),
          ),
          // save request button
          floatingActionButton: SizedBox(
            height: 50.v,
            width: 200.h,
            child: ElevatedButton(
              style: CustomButtonStyles.outlineButtonGreen500,
              onPressed: () {
                // controller.createNewWorkout();
                controller.createRequest();
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
