import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/menu_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/menu_view.dart';

class WorkPlaceScreen extends StatelessWidget {
  const WorkPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Welcome ${controller.currentMember.value.fullName}',
                    'Welcome Van Tung',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Let see how can we\ncook today?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              // IconButton(
              //     onPressed: () {
              //       controller.goToNotification();
              //     },
              //     icon: Icon(
              //       Icons.notifications,
              //       color: Theme.of(context).primaryColor,
              //     ))
            ],
          ),
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
                        icon: Icon(Icons.food_bank),
                        text: "Menu",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.local_fire_department_rounded,
                          color: Colors.red,
                        ),
                        text: "Exercises",
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.h),
                    height: 590.h,
                    // width: 50.v,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // const FoodView(),

                        const MenuView(),
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
