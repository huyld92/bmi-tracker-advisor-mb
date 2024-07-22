import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Fitness Instructor',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    )
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
