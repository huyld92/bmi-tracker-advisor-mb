import 'package:bmi_tracker_mb_advisor/screens/blog/controller/blog_controller.dart';

import '../../../util/app_export.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogController());
  }
}
