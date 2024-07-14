import 'package:bmi_tracker_mb_advisor/screens/splash_screen/binding/splash_binding.dart';
import 'package:bmi_tracker_mb_advisor/screens/splash_screen/splash_screen.dart';
import 'package:bmi_tracker_mb_advisor/utils/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
