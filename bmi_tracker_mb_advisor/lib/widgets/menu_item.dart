import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final String photo;
  final String description;
  final String totalKcal;

  MenuItem(
      {super.key,
      required this.name,
      required this.photo,
      required this.description,
      required this.totalKcal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(description),
      trailing: Text('1200 kcal', style: TextStyle(fontSize: 15.fSize)),
    );
  }
}
