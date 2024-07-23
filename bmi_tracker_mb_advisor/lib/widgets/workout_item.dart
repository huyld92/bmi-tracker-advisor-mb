import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class WorkoutItem extends StatelessWidget {
  final String name;
  final String description;
  final String standardWeight;

  WorkoutItem(
      {super.key,
      required this.name,
      required this.description,
      required this.standardWeight});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(description),
      trailing: Text('70 kg', style: TextStyle(fontSize: 15.fSize)),
    );
  }
}
