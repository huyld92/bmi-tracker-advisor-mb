import 'package:bmi_tracker_mb_advisor/screens/food_detail/controller/food_details_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class FoodDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodDetailsController());
  }
}
