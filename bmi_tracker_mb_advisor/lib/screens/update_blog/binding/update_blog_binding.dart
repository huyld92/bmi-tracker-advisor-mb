import 'package:bmi_tracker_mb_advisor/screens/update_blog/controller/update_blog_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class UpdateBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateBlogController());
  }
}
