import 'dart:developer';

import 'package:bmi_tracker_mb_advisor/screens/feedback/feedback_complete_screen.dart';
import 'package:flutter/material.dart';

import '../../util/app_export.dart';
import '../../widgets/custom_drop_down_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/show_feedback_dialog.dart';
import 'controller/feedback_controller.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    final feedbackController = Get.put(FeedbackController());
    Future<void> _showSimpleDialog() async {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return const FeedbackDialog();
        },
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Give feedback',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  'Title Feedback',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    // controller: feedbackController.titleController,

                    // validator: (value) {
                    //   return feedbackController.validateTitle(value!);
                    // },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Your Title',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Feedback type',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  //! type
                  child: CustomDropDownButton(
                    textValue: feedbackController.feedbackType,
                    onChange: (value) {
                      setState(() {
                        log(value!);
                        feedbackController.feedbackType = value.toString();
                      });
                    },
                  ), // nếu bị lỗi khi truyền custom list text thì thay đổi biến selectedValue trong widget này bằng 1 trong các text trong list
                ),
                const SizedBox(height: 20),
                Text(
                  'Comment, if any?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    maxLines: 10,
                    controller: feedbackController.descriptionController,
                    validator: (value) {
                      return feedbackController.validateDescription(value!);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Say something here...',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  // onPressed: _showSimpleDialog,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    // await userbodymaxController.registUserBodyMax(context,
                    //     menus: <String>['d7349d45-db29-4e6b-adac-45e00cf4d5a5']);

                    await feedbackController.registerFeedback(context);

                    if (feedbackController.isLoading.value == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeedbackComplete(),
                        ),
                        (route) => false,
                      );
                    }
                    log('feedback drop: ${feedbackController.feedbackType}');
                    // Get.to(FeedbackComplete());
                  },
                  text: 'SEND FEEDBACK',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
