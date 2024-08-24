// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_tracker_mb_advisor/screens/register_account/controller/register_account_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_drop_down_gender.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_text_form_password_field.dart';
import '../../widgets/custom_textnumber_form_field.dart';

class RegisterAccountScreen extends GetView<RegisterAccountController> {
  const RegisterAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
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
              'Register Account',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
            ),
          ),
          body: SafeArea(
            child: SizedBox(
              height: mediaQueryData.size.height - 150.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Form(
                        key: controller.registerFormKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.v),
                                  child: Text(
                                    'Full name',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //! full Name field
                                CustomTextFormField(
                                  controller: controller.fullNameController,
                                  onSaved: (value) {
                                    controller.fullName = value!;
                                  },
                                  validator: (value) {
                                    return controller.validateFullName(value!);
                                  },
                                  hintTxt: 'Enter fullname',
                                  // suffixIcon: const Icon(Icons.email_outlined),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.v),
                                  child: Text(
                                    'Your email',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //! email field
                                CustomTextFormField(
                                  controller: controller.emailController,
                                  onSaved: (value) {
                                    controller.email = value!;
                                  },
                                  validator: (value) {
                                    return controller.validateEmail(value!);
                                  },
                                  hintTxt: 'Enter your email',
                                  suffixIcon: const Icon(Icons.email_outlined),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.v),
                                  child: Text(
                                    'Phone Number',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // ! phonenumber field
                                CustomTextNumberFormField(
                                  controller: controller.phoneNumberController,
                                  onSaved: (value) {
                                    controller.phoneNumber = value!;
                                  },
                                  validator: (value) {
                                    return controller
                                        .validatePhoneNumber(value!);
                                  },
                                  hintTxt: 'Enter Phone number',
                                  // suffixIcon: const Icon(Icons.email_outlined),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.v),
                                  child: Text(
                                    'Password',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //! password field
                                Obx(
                                      () =>
                                      CustomTextPasswordField(
                                        controller: controller
                                            .passwordController,
                                        onSaved: (value) {
                                          controller.password = value!;
                                        },
                                        validator: (value) {
                                          return controller
                                              .validatePassword(value!);
                                        },
                                        hintTxt: 'Enter your password',
                                        isObscure: controller.passwordVisible
                                            .value,
                                        suffixIcon: IconButton(
                                          icon: controller.passwordVisible.value
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                              Icons.visibility_off),
                                          onPressed: () {
                                            controller.passwordVisible.value =
                                            !controller.passwordVisible.value;
                                          },
                                        ),
                                      ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.v),
                                  child: Text(
                                    'Confirm password',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //! password field
                                Obx(
                                      () =>
                                      CustomTextPasswordField(
                                        controller: controller
                                            .rePasswordController,
                                        onSaved: (value) {
                                          controller.rePassword = value!;
                                        },
                                        validator: (value) {
                                          return controller
                                              .validateRePassword(value!);
                                        },
                                        hintTxt: 'Enter Confirm password',
                                        isObscure:
                                        controller.confirmPasswordVisible.value,
                                        suffixIcon: IconButton(
                                          icon: controller
                                              .confirmPasswordVisible.value
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                              Icons.visibility_off),
                                          onPressed: () {
                                            controller
                                                .confirmPasswordVisible.value =
                                            !controller
                                                .confirmPasswordVisible.value;
                                          },
                                        ),
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 15.v),
                                      child: Text(
                                        'Gender',
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 15.v),
                                      child: Text(
                                        'Your Birthday',
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //! gender field
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 100.h,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      //! type
                                      child: CustomDropDownGender(
                                        textValue:
                                        controller.genderValue.toString(),
                                        onChange: (value) {
                                          controller.genderValue =
                                              value.toString();
                                        },
                                      ), // nếu bị lỗi khi truyền custom list text thì thay đổi biến selectedValue trong widget này bằng 1 trong các text trong list
                                    ),

                                    //! birthday field
                                    Column(
                                      children: [
                                        Obx(
                                              () =>
                                              TextButton.icon(
                                                style: TextButton.styleFrom(
                                                  textStyle:
                                                  CustomTextStyles.bodyMedium14,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(23),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  // 16 tuổi
                                                  DateTime now = DateTime.now();
                                                  DateTime initialDate = DateTime(
                                                      now.year - 16,
                                                      now.month,
                                                      now.day);

                                                  DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: initialDate,
                                                      firstDate: DateTime(1900),
                                                      lastDate: initialDate);

                                                  if (pickedDate != null) {
                                                    controller.birthday.value =
                                                        pickedDate.format();
                                                  }
                                                },
                                                icon: const Icon(
                                                    Icons
                                                        .calendar_today_rounded),
                                                label: Text(
                                                  controller.birthday.value,
                                                ),
                                              ),
                                        ),
                                        Obx(() {
                                          if (controller.birthdayError.isEmpty) {
                                            return Container();
                                          } else {
                                            return Text(
                                                "${controller.birthdayError}",
                                                style: CustomTextStyles
                                                    .bodyMedium11Red700);
                                          }
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomElevatedButton(
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const RegisterComplete(),
              //     ),
              //   );
              // },
                onPressed: () async {
                  FocusScope.of(context).unfocus();

                  await controller.registerEmail(context);
                },
                text: 'Continue'),
          ),
        ),
      );
    });
  }
}

class TextFieldWithLabel extends StatelessWidget {
  final String labelText;
  final String hintText;

  // String? Function(String?)? validator;
  // TextEditingController? controller;

  const TextFieldWithLabel({
    Key? key,
    required this.labelText,
    required this.hintText,
    // this.validator,
    // this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge!
              .copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomTextFormField(
          hintTxt: hintText,
        ),
      ],
    );
  }
}
