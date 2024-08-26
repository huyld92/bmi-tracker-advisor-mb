import 'package:bmi_tracker_mb_advisor/screens/chat_conversations/controller/chat_conversations_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';

class ChatConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatConversationController());
  }
}
