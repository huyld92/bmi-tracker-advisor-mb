import 'package:bmi_tracker_mb_advisor/theme/theme_helper.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  static get titleLarge =>
      theme.textTheme.titleLarge!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,

      );
  static get bodyMedium13Red =>
      theme.textTheme.bodyMedium!.copyWith(
          color: Colors.red,
        fontSize: 13.fSize
      );
  static get bodyMedium13Green =>
      theme.textTheme.bodyMedium!.copyWith(
          color: Colors.green,
        fontSize: 13.fSize
      );
  static get linkTextStyle14 =>
      theme.textTheme.bodyMedium!.copyWith(
          color: Colors.blue,
        fontSize: 14.fSize
      );
}
