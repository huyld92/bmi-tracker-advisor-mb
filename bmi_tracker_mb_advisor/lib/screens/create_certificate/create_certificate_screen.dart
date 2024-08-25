import 'package:bmi_tracker_mb_advisor/screens/create_certificate/controller/create_certificate_controller.dart';
import 'package:flutter/material.dart';

import '../../theme/custom_button_style.dart';
import '../../util/app_export.dart';

class CreateCertificateScreen extends GetView<CreateCertificateController> {
  const CreateCertificateScreen({super.key});

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
                    'Create Certificate',
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    'create a package suitable for your member',
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
              key: controller.createCertificateFormKey,
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
                            image: const AssetImage(
                                'assets/images/certificate.png'),
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
                    maxLines: 1,
                    controller: controller.txtCertificateNameController,
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
                    'Certificate Link',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 3,
                    controller: controller.txtCertificateLinkController,
                    validator: (value) {
                      return controller.validateCertificateLink(value!);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter link'.tr,
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
        // save plan button
        floatingActionButton: SizedBox(
          height: 50.v,
          width: 200.h,
          child: ElevatedButton(
            style: CustomButtonStyles.outlineButtonGreen500,
            onPressed: () {
              // controller.createNewWorkout();
              controller.createCertificate();
            },
            child: Text(
              "Save".tr,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );});
  }
}
