import 'package:bmi_tracker_mb_advisor/screens/create_plan/create_plan_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/plan_item_widget.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Plan',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 15.h, top: 10.v, right: 15.h, bottom: 20.v),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.v);
          },
          // itemCount: controller.subscriptionModels.length,
          itemCount: 5,
          itemBuilder: (context, index) {
            return PlanItemWidget(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Color.fromARGB(255, 104, 127, 142),
        onPressed: () {
          // controller.goToCreateBlog();
          Get.to(CreatePlanScreen());
        },
        child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
      ),
    );
  }
}
