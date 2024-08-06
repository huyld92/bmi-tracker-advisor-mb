import 'package:bmi_tracker_mb_advisor/screens/create_plan/controller/create_plan_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';
import '../../theme/theme_helper.dart';

class CreatePlanScreen extends GetView<CreatePlanController> {
  const CreatePlanScreen({super.key});

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
                    // 'title_appbar_crete_workout'.tr,
                    'Create Plan',
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    'create a plan suitable for your member',
                    // 'Welcome Van Tung',
                    style: theme.textTheme.bodyMedium,
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
              key: controller.createPlanFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 136, 212, 241),
                          radius: 40,
                          child: Image(
                            image: const AssetImage('assets/images/plan.png'),
                            width: 40.adaptSize,
                            height: 40.adaptSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Plan Name',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 1,
                    controller: controller.txtPlanNameController,
                    onSaved: (value) {
                      controller.planName = value!;
                    },
                    validator: (value) {
                      return controller.validatePlanName(value!);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter plan name'.tr,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    // 'txt_standard_weight'.tr,
                    'Price (VND)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 1,
                    controller: controller.planPriceController,
                    onSaved: (value) {
                      controller.planPrice = value!;
                    },
                    validator: (value) {
                      return controller.validatePlanPrice(value!);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'txt_hint_standard_weight'.tr,
                      hintText: 'Enter price',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    // 'txt_standard_weight'.tr,
                    'Plan Description',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 3,
                    controller: controller.planDescriptionController,
                    onSaved: (value) {
                      controller.planDescription = value!;
                    },
                    validator: (value) {
                      return controller.validatePlanDescription(value!);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'txt_hint_standard_weight'.tr,
                      hintText: 'Enter plan description',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    // 'txt_standard_weight'.tr,
                    'Plan Duration (days)',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 1,
                    controller: controller.planDurationController,
                    onSaved: (value) {
                      controller.planDuration = value!;
                    },
                    validator: (value) {
                      return controller.validatePlanDuration(value!);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'txt_hint_standard_weight'.tr,
                      hintText: 'Enter plan duration',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
        ),
        // save plan button
        floatingActionButton: SizedBox(
          height: 50.v,
          width: 200.h,
          child: ElevatedButton(
            style: CustomButtonStyles.outlineButtonGreen500,
            onPressed: () {
              // controller.createNewWorkout();
              controller.createPlan();
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
