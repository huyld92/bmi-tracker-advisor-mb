import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class CreateWorkoutScreen extends StatefulWidget {
  final void Function()? onCreateWorkoutScreenClick;
  const CreateWorkoutScreen({
    Key? key,
    this.onCreateWorkoutScreenClick,
  }) : super(key: key);

  @override
  _CreateWorkoutScreenState createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  // var controller = Get.put(CreateWorkoutScreenMealFoodController());

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Workout',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'create a workout suitable for your member',
                    // 'Welcome Van Tung',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          // padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.food_bank_rounded,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Workout name',
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
                    hintText: 'Enter Workout Name',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Workout Description',
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
                  maxLines: 5,
                  // controller: feedbackController.titleController,
                  // validator: (value) {
                  //   return feedbackController.validateTitle(value!);
                  // },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Workout Description',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
