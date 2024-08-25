import 'package:bmi_tracker_mb_advisor/screens/chat/controller/chat_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class ChatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }

}