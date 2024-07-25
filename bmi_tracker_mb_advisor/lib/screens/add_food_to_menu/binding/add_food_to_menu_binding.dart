import 'package:bmi_tracker_mb_advisor/screens/add_food_to_menu/controller/add_food_to_menu_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class AddFoodToMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddFoodToMenuController());
  }
}
