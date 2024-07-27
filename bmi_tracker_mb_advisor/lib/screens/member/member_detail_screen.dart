import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/member_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MemberDetailsScreen extends StatelessWidget {
  const MemberDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Column(
        children: [
          Container(
            height: 260.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(
                    'https://res.cloudinary.com/dlipvbdwi/image/upload/v1696896650/cld-sample.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // '${blogController.currentBlog[0].users?.fullName}',
                          'Jase Ramsey',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Age: 28',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.grey[25]),
                        )
                      ],
                    ),
                    // now button
                    // FilledButton(
                    //   onPressed: () {
                    //     // controller.goToChoosePlan();
                    //   },
                    //   style: FilledButton.styleFrom(
                    //     backgroundColor: Theme.of(context).primaryColor,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //   ),
                    //   child: const Text('Static'),
                    // )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: MemberInfoCard(),
                ),
                Text(
                  'Static',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // now button
                        FilledButton(
                          onPressed: () {
                            // controller.goToChoosePlan();
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 102, 212, 255),
                            fixedSize: Size(150, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/weight-scale.png'),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Text(
                          'Weight Static',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      children: [
                        // now button
                        FilledButton(
                          onPressed: () {
                            // controller.goToChoosePlan();
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 252, 252, 91),
                            fixedSize: Size(150, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/calories.png'),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Text(
                          'Calories Static',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Customize Menu and Workout',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // now button
                        FilledButton(
                          onPressed: () {
                            // controller.goToChoosePlan();
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xffd7ecb6),
                            fixedSize: Size(150, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/menu.png'),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Text(
                          'Add Menu',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      children: [
                        // now button
                        FilledButton(
                          onPressed: () {
                            // controller.goToChoosePlan();
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 54, 110, 231),
                            fixedSize: Size(150, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/workout.png'),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Text(
                          'Workout',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
