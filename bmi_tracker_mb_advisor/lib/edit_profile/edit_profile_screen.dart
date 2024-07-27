import 'package:bmi_tracker_mb_advisor/widgets/custom_text_form_field.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_textnumber_form_field.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants/size.dart';
import '../util/app_export.dart';
import '../widgets/custom_drop_down_gender.dart';
import '../widgets/custom_elevated_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text('Edit Profile',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120.h,
                      height: 120.v,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                            image:
                                // NetworkImage(controller
                                //     .currentMember.value.accountPhoto!)
                                NetworkImage(
                                    'https://res.cloudinary.com/dlipvbdwi/image/upload/v1700192116/avatar_snfpmg.jpg')),
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
                            // controller.selectAndUploadImage();
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
                        'Email',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      CustomTextFormField(
                        enable: false,
                        // labelText: controller.currentMember.value.email,
                        labelText: 'vantung10@gmail.com',
                        suffixIcon: const Icon(Icons.email_outlined),
                      ),
                      Text(
                        'Full name',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      CustomTextFormField(
                        // enable: false,
                        // labelText: controller.currentMember.value.email,
                        labelText: 'Van Tung',
                        suffixIcon: const Icon(Icons.person),
                      ),
                      Text(
                        'Phone number',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      CustomTextNumberFormField(
                        // controller: controller.phoneNumberController,
                        suffixIcon: const Icon(Icons.phone),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.v),
                            width: 100.h,
                            child: Text(
                              'Gender',
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
                              'Your Birthday',
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
                          Container(
                            width: 100.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            //! type
                            child: CustomDropDownGender(
                              // textValue: controller.gender.value,
                              textValue: 'Male',
                              onChange: (value) {
                                // controller.currentMember.value.gender = value;
                                // controller.gender.value = value;
                              },
                            ),
                            // nếu bị lỗi khi truyền custom list text thì thay đổi biến selectedValue trong widget này bằng 1 trong các text trong list
                          ),
                          //! birthday field
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23),
                              ),
                              padding: EdgeInsets.only(left: 40.h),
                            ),
                            onPressed: () async {
                              // DateTime? pickedDate = await showDatePicker(
                              //   context: context,
                              //   initialDate:
                              //       controller.currentMember.value.birthday,
                              //   firstDate: DateTime(1900),
                              //   lastDate: DateTime.now(),
                              // );

                              // if (pickedDate != null) {
                              //   controller.currentMember.value.birthday =
                              //       pickedDate;
                              //   controller.birthday.value =
                              //       pickedDate.format();
                              // }
                            },
                            icon: const Icon(Icons.calendar_today_rounded,
                                color: Colors.black),
                            label: Text(
                              '2000-05-28',
                              // controller.birthday.value,
                              style: TextStyle(
                                  fontSize: 16.fSize, color: Colors.black),
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
                            // controller.updateProfile();
                          },
                          text: 'Edit Profile'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
