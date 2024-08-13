import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/screens/register_certificate/controller/register_certificate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../theme/custom_button_style.dart';
import '../../util/app_export.dart';
import '../../widgets/custom_drop_down_button.dart';

class RegisterCertificateScreen extends GetView<RegisterCertificateController> {
  const RegisterCertificateScreen({super.key});

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
                    'Register Certificate',
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
              key: controller.registCertiFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 230, 250, 208),
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
                    'Certificate Name',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 2,
                    controller: controller.certificateNameController,
                    // onSaved: (value) {
                    //   controller.purpose = value!;
                    // },
                    validator: (value) {
                      return controller.validateCertificateName(value!);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter here'.tr,
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
                    'Purpose',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 5,
                    controller: controller.certificateLinkController,
                    // onSaved: (value) {
                    //   controller.purpose = value!;
                    // },
                    validator: (value) {
                      return controller.validateCertificateLink(value!);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter here'.tr,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
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
              controller.registCertificate(context);
            },
            child: Text(
              "Save".tr,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
