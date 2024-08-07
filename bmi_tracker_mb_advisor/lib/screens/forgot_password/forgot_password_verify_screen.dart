import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';
import '../login/login_screen.dart';

class ForgotPasswordVerifyScreen extends StatelessWidget {
  const ForgotPasswordVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                child: Column(
                  children: [
                    Text(
                      "All Set!",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      "We're already sent verify link on your mail!\n       Please verify and get back to login!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomElevatedButton(
            onPressed: () {
              Get.offAll(() => const LoginScreen());
            },
            text: 'Continue'),
      ),
    );
  }
}
