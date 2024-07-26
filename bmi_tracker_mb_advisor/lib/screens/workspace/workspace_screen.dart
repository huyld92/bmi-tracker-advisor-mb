import 'package:bmi_tracker_mb_advisor/screens/menu/menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout/workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/menu_view.dart';

class WorkspaceScreen extends StatelessWidget {
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
          title: Text("Workspace", style: theme.textTheme.titleLarge),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10.h),
              child: IconButton(
                onPressed: () {},
                iconSize: 28.adaptSize,
                icon: Icon(Icons.notifications_active_outlined),
              ),
            )
          ],
        ),
        // appBar: AppBar(
        //   toolbarHeight: 100,
        //   title: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             // 'Welcome ${controller.currentMember.value.fullName}',
        //             'Welcome Van Tung',
        //             style: Theme.of(context).textTheme.bodyLarge,
        //           ),
        //           Text(
        //             'Let see how can we\ncook today?',
        //             style: Theme.of(context).textTheme.headlineSmall,
        //           ),
        //         ],
        //       ),
        //       // IconButton(
        //       //     onPressed: () {
        //       //       controller.goToNotification();
        //       //     },
        //       //     icon: Icon(
        //       //       Icons.notifications,
        //       //       color: Theme.of(context).primaryColor,
        //       //     ))
        //     ],
        //   ),
        // ),
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
