import 'package:bmi_tracker_mb_advisor/screens/splash_screen/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
