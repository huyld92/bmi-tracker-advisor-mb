import 'package:get/get.dart';

import '../controller/menu_details_controller.dart';

class MenuDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuDetailsController());
  }
}
