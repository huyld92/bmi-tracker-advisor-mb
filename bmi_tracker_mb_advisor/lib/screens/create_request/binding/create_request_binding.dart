import 'package:bmi_tracker_mb_advisor/screens/create_request/controller/create_request_controller.dart';

import '../../../util/app_export.dart';

class CreateRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRequestController());
  }
}
