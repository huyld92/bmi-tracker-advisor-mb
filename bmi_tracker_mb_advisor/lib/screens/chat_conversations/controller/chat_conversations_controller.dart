import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

class ChatConversationController extends GetxController with MessageListener {
  var isLoading = false.obs;

  CometChatMessageListController? messageListState;

  @override
  void onInit() {
    fetchChatScreenData();
    super.onInit();
  }

  void fetchChatScreenData() {
    isLoading.value = true; 
    CometChat.addMessageListener("listenerId", this);
    isLoading.value = false;
  }

  @override
  void onTextMessageReceived(TextMessage textMessage) {
    messageListState!.addMessage(textMessage);
  }
}
