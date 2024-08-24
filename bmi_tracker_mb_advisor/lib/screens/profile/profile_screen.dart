import 'package:bmi_tracker_mb_advisor/screens/profile/controller/profile_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/profile_account.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants/size.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

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
            title: Text('txt_profile'.tr, style: theme.textTheme.titleLarge),
            actions: [
              IconButton(
                  onPressed: () => {controller.goToUpdateProfileScreen()},
                  icon: const Icon(LineAwesomeIcons.alternate_pencil)),
            ]),
        body: SingleChildScrollView(
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
                        child: Obx(
                          () => Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "${controller.accountModel.value.accountPhoto}",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.v),
                Obx(
                  () => Text('${controller.accountModel.value.fullName}',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                // Text('BMI: ${controller.currentMember.value.bmi?.round()}',
                Obx(
                  () => Text('${controller.accountModel.value.email}',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                SizedBox(height: 20.v),

                //Subscription history
                ProfileAccountWidget(
                  title: "txt_subscription_history".tr,
                  iconimage: const AssetImage(
                      'assets/images/subscription_history.png'),
                  onPress: () {
                    controller.goToSubscriptionHistory();
                  },
                ),
                ProfileAccountWidget(
                  title: 'Support Request',
                  iconimage: const AssetImage('assets/images/request.png'),
                  onPress: () {
                    controller.goToRequestScreen();
                  },
                ),
                ProfileAccountWidget(
                  title: 'Certificate',
                  iconimage: const AssetImage('assets/images/certificate.png'),
                  onPress: () {
                    controller.goToCertificateScreen();
                  },
                ),
                ProfileAccountWidget(
                  title: 'Package',
                  iconimage: const AssetImage('assets/images/plan.png'),
                  onPress: () {
                    controller.goToPackageScreen();
                  },
                ),
                ProfileAccountWidget(
                  title: 'Change Password',
                  iconimage:
                      const AssetImage('assets/images/change_password.png'),
                  onPress: () {
                    controller.goToChangePasswordScreen();
                  },
                ),
                Divider(color: appTheme.grey500),
                SizedBox(height: 10.v),
                ProfileAccountWidget(
                  title: "txt_logout".tr,
                  iconimage: const AssetImage('assets/images/logout.png'),
                  onPress: () {
                    controller.logout();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
