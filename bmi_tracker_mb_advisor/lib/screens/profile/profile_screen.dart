import 'package:bmi_tracker_mb_advisor/edit_profile/edit_profile_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/profile_account.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            IconButton(
                onPressed: () => {
                      Get.to(EditProfileScreen()),
                      // controller.goToUpdateProfileScreen()
                    },
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
                      child: Image(
                          image: NetworkImage(
                              'https://res.cloudinary.com/dlipvbdwi/image/upload/v1700192116/avatar_snfpmg.jpg')),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.v),
              // Text('${controller.currentMember.value.fullName}',
              Text('Van Tung',
                  style: Theme.of(context).textTheme.headlineMedium),
              // Text('BMI: ${controller.currentMember.value.bmi?.round()}',
              Text('tung10@gmail.com',
                  style: Theme.of(context).textTheme.bodyLarge),
              //const SizedBox(height: 20),
              const SizedBox(height: 20),

              //MENU
              ProfileAccountWidget(
                title: "Subscription History",
                iconimage: AssetImage('assets/images/subcription history.png'),
                onPress: () {},
              ),
              ProfileAccountWidget(
                title: "Feedback",
                iconimage: AssetImage('assets/images/feedback.png'),
                onPress: () {},
              ),
              const Divider(color: Colors.grey),
              SizedBox(height: 10.v),
              ProfileAccountWidget(
                title: "Logout",
                iconimage: AssetImage('assets/images/logout.png'),
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
