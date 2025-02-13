import 'package:bmi_tracker_mb_advisor/screens/create_workout/create_workout_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/workout/controller/workout_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/workout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutView extends GetView<WorkoutController> {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffd7ecb6),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 10,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onPressed: () {
              Get.to(CreateWorkoutScreen());
            },
            child: SizedBox(
              width: 100.h,
              height: 30.v,
              child: Center(
                child: Text(
                  'Create Workout',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 550.v,
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Slidable(
                endActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      // controller.goToUpdateMealLog(index);
                    },
                    backgroundColor: const Color(0xFF1FBE1B),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      // controller.removeMealLog(index);
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ]),
                child: WorkoutItem(
                    name: 'name',
                    description: 'description',
                    standardWeight: '75 kg'),
              );
            },
          ),
        ),
      ],
    );
  }
}
