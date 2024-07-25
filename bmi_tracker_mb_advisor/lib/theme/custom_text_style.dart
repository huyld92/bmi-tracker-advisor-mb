import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  static get titleMedium16Black => theme.textTheme.titleMedium!.copyWith(
        color: Colors.black,
        fontSize: 16.fSize,
        fontWeight: FontWeight.bold,
      );

  static get titleMediumWhite => theme.textTheme.titleMedium!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  static get bodyMediumGreen500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.green500,
        // fontWeight: FontWeight.bold,
      );

  static get bodyMedium13Red => theme.textTheme.bodyMedium!
      .copyWith(color: Colors.red, fontSize: 13.fSize);

  static get bodyMedium13Green => theme.textTheme.bodyMedium!
      .copyWith(color: Colors.green, fontSize: 13.fSize);

  static get bodyMedium14 => theme.textTheme.bodyMedium!
      .copyWith(color: Colors.black, fontSize: 14.fSize);

  static get bodyMedium14White => theme.textTheme.bodyMedium!
      .copyWith(color: Colors.white, fontSize: 14.fSize);

  static get linkTextStyle14 => theme.textTheme.bodyMedium!
      .copyWith(color: Colors.blue, fontSize: 14.fSize);
}
