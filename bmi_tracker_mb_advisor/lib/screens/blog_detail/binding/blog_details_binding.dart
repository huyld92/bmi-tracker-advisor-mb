import 'package:bmi_tracker_mb_advisor/screens/blog_detail/controller/blog_detail_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class BlogDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BlogDetailController());
  }

}