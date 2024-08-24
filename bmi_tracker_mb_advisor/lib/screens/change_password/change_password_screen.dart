import 'package:bmi_tracker_mb_advisor/screens/change_password/controller/change_password_controller.dart';
import 'package:flutter/material.dart';

import '../../util/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_text_form_password_field.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

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
          appBar: AppBar(
            title: Text(
              'Change Your Password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                  child: Form(
                    key: controller.changePasswordFormKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.v),
                              child: Text(
                                'Old Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Obx(
                              () => CustomTextPasswordField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.oldPasswordController,
                                validator: (value) {
                                  return controller.validateOldPassword(value!);
                                },
                                hintTxt: 'Enter here',
                                isObscure: controller.oldPasswordVisible.value,
                                suffixIcon: IconButton(
                                  icon: controller.oldPasswordVisible.value
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    // chuyển đổi trạng thái ẩn hiện mât khẩu
                                    controller.oldPasswordVisible.value =
                                        !controller.oldPasswordVisible.value;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.v),
                              child: Text(
                                'New Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Obx(
                              () => CustomTextPasswordField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.newPasswordController,
                                validator: (value) {
                                  return controller.validateNewPassword(value!);
                                },
                                hintTxt: 'Enter here',
                                isObscure: controller.newPasswordVisible.value,
                                suffixIcon: IconButton(
                                  icon: controller.newPasswordVisible.value
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    // chuyển đổi trạng thái ẩn hiện mât khẩu
                                    controller.newPasswordVisible.value =
                                        !controller.newPasswordVisible.value;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.v),
                              child: Text(
                                'Confirm Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Obx(
                              () => CustomTextPasswordField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.rePasswordController,
                                validator: (value) {
                                  return controller.validateRePassword(value!);
                                },
                                hintTxt: 'Enter here',
                                isObscure:
                                    controller.confirmPasswordVisible.value,
                                suffixIcon: IconButton(
                                  icon: controller.confirmPasswordVisible.value
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    // chuyển đổi trạng thái ẩn hiện mât khẩu
                                    controller.confirmPasswordVisible.value =
                                        !controller
                                            .confirmPasswordVisible.value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomElevatedButton(
                onPressed: () {
                  controller.changePassword();
                },
                text: 'Continue'),
          ),
        ),
      );
    });
  }
}
