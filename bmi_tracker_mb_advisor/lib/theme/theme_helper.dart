import 'package:bmi_tracker_mb_advisor/utils/app_export.dart';
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
  static TextTheme textTheme(ColorScheme colorScheme) => const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xff31493b),
        ),
        headlineMedium: TextStyle(
          color: Color(0xff31493b),
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: Color(0xff31493b),
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: Color(0xff219367),
          fontWeight: FontWeight.bold,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    primary: Color(0X3D40BFFF),
    onPrimary: Color(0X87223263),
    onPrimaryContainer: Color(0X87FFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get amber500 => const Color(0XFFFFC107);

  Color get blue50 => const Color(0XFFEAEFFF);

  Color get blueA200 => const Color(0XFF4091FF);

  Color get blueGray300 => const Color(0XFF9098B1);

  Color get gray400 => const Color(0XFFC4C4C4);

  Color get indigoA200 => const Color(0XFF5B61F4);

  Color get lightBlue600 => const Color(0XFF039BE5);

  Color get pink300 => const Color(0XFFFB7181);

  Color get yellow700 => const Color(0XFFFFC732);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();
