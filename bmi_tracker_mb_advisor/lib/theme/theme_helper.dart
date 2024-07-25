import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    PrefUtils().setThemeData(newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: const Color(0xff31493b),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'JosefinSans',
      textTheme: TextThemes.textTheme(colorScheme),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displayLarge: TextStyle(color: Color(0xff31493b), fontSize: 30.fSize),
        headlineMedium: TextStyle(
            color: Color(0xff31493b),
            fontWeight: FontWeight.bold,
            fontSize: 24.fSize),
        headlineSmall: TextStyle(
            color: Color(0xff31493b),
            fontWeight: FontWeight.bold,
            fontSize: 20.fSize),
        headlineLarge: TextStyle(
            color: Color(0xff31493b),
            fontWeight: FontWeight.bold,
            fontSize: 26.fSize),
        titleLarge: TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.bold,
          fontSize: 20.fSize,
        ),
        titleMedium: TextStyle(
          color: Color(0xff000000),
          // fontWeight: FontWeight.bold,
          fontSize: 12.fSize,
        ),
        titleSmall: TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.bold,
          fontSize: 16.fSize,
        ),
        bodyLarge: TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.w400,
          fontSize: 16.fSize,
        ),
        bodyMedium: TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.w400,
          fontSize: 14.fSize,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    primary: Color(0XFF4CAF50),
    onPrimary: Color(0X870D47A1),
    onPrimaryContainer: Color(0X87FFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get green500 => const Color(0XFF4CAF50);

  Color get grey300 => const Color(0XFFE0E0E0);

  Color get grey100 => const Color(0XFFF5F5F5);

  Color get white => const Color(0XFFFFFFFF);

  Color get blueA700 => const Color(0XFF2962FF);

  Color get blue900 => const Color(0X870D47A1);

  Color get red500 => const Color(0XFFF44336);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();
