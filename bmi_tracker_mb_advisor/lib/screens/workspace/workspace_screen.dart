import 'package:bmi_tracker_mb_advisor/screens/menu/menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout/workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import 'controller/workspace_controller.dart';

class WorkspaceScreen extends GetView<WorkspaceController> {
  const WorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("txt_workspace".tr, style: theme.textTheme.titleLarge),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10.h),
              child: IconButton(
                onPressed: () {
                  controller.goToNotifications();
                },
                iconSize: 28.adaptSize,
                icon: const Icon(Icons.notifications_active_outlined),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    physics: NeverScrollableScrollPhysics(),
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.food_bank,
                          color: Colors.green,
                        ),
                        text: "Menu",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.local_fire_department_rounded,
                          color: Colors.red,
                        ),
                        text: "Workout",
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.h),
                    height: 600.v,
                    // width: 50.v,
                    child: const TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        // const FoodView(),
                        MenuScreen(),
                        WorkoutScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
