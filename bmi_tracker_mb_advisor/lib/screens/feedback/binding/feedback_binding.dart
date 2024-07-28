import 'package:bmi_tracker_mb_advisor/screens/feedback/controller/feedback_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackController());
  }
}
