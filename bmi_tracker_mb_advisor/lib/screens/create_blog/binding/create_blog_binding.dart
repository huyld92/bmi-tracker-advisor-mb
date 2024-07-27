import 'package:bmi_tracker_mb_advisor/screens/create_blog/controller/create_blog_controller.dart';

import '../../../util/app_export.dart';

class CreateBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateBlogController());
  }
}
