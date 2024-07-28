import 'package:bmi_tracker_mb_advisor/screens/edit_blog/controller/edit_blog_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class EditBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditBlogController());
  }
}
