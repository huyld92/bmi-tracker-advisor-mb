import 'package:bmi_tracker_mb_advisor/widgets/custom_text_form_field.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_textnumber_form_field.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../util/app_export.dart';
import '../../widgets/custom_drop_down_gender.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/update_profile_controller.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({super.key});

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
          // leading: IconButton(
          //     onPressed: () => Get.back(),
          //     icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text('txt_edit_profile'.tr, style: theme.textTheme.titleLarge),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30.v),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120.h,
                        height: 120.v,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Obx(
                            () => Image(
                              image: NetworkImage(
                                controller.accountModel.value.accountPhoto!,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xff27b761),
                          ),
                          child: IconButton(
                            icon: Icon(LineAwesomeIcons.camera,
                                size: 20.0.fSize, color: Colors.black),
                            onPressed: () {
                              controller.selectAndUploadImage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.v),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'txt_email'.tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        CustomTextFormField(
                          enable: false,
                          labelText: controller.accountModel.value.email,
                          suffixIcon: const Icon(Icons.email_outlined),
                        ),
                        Text(
                          'txt_full_name'.tr,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        CustomTextFormField(
                          // enable: false,
                          // labelText: controller.currentMember.value.email,
                          controller: controller.txtFullNameController,
                          suffixIcon: const Icon(Icons.person),
                        ),
                        Text(
                          'txt_phone_number'.tr,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        CustomTextNumberFormField(
                          controller: controller.txtPhoneNumberController,
                          suffixIcon: const Icon(Icons.phone),
                        ),
                        Text(
                          'Bank Name'.tr,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        CustomTextFormField(
                          enable: false,
                          labelText: 'TP Bank',
                          suffixIcon: const Icon(Icons.account_balance),
                        ),
                        Text(
                          'Bank Number'.tr,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        CustomTextNumberFormField(
                          controller: controller.txtBankNumberController,
                          // suffixIcon: const Icon(Icons.),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15.v),
                              width: 100.h,
                              child: Text(
                                'txt_gender'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40.h),
                              child: Text(
                                'txt_your_birthday'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        //! gender birthday row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // gender field
                            Obx(
                              () => Container(
                                width: 100.h,
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                //! type
                                child: CustomDropDownGender(
                                  textValue: controller.gender.value,
                                  onChange: (value) {
                                    // controller.currentMember.value.gender = value;
                                    controller.gender.value = value;
                                  },
                                ),
                                // nếu bị lỗi khi truyền custom list text thì thay đổi biến selectedValue trong widget này bằng 1 trong các text trong list
                              ),
                            ),
                            //! birthday field
                            Obx(
                              () => TextButton.icon(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      const TextStyle(color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  padding: EdgeInsets.only(left: 40.h),
                                ),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        controller.accountModel.value.birthday,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                     controller.accountModel.value.birthday =
                                        pickedDate;
                                    controller.birthday.value =
                                        pickedDate.format();
                                  }
                                },
                                icon: const Icon(Icons.calendar_today_rounded,
                                    color: Colors.black),
                                label: Text(
                                  controller.birthday.value,
                                  style: TextStyle(
                                      fontSize: 16.fSize, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.v),
                    // flex: 2,
                    child: Column(
                      children: [
                        CustomElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.updateProfile();
                            },
                            text: 'txt_update_profile'.tr),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
