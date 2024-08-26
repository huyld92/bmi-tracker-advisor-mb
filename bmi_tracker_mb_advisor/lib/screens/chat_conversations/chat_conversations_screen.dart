import 'package:bmi_tracker_mb_advisor/screens/chat_conversations/controller/chat_conversations_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

class ChatConversationsScreen extends GetView<ChatConversationController> {
  const ChatConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          backgroundColor: appTheme.white,
          body: Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(appTheme.green500),
            ),
          ),
        );
      }
      return Scaffold(
        body: SafeArea(
          child: CometChatConversationsWithMessages(
            conversationsConfiguration: ConversationsConfiguration(
                backButton: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                appBarOptions: []),
            messageConfiguration: MessageConfiguration(
              messageListView: (user, group, context) {
                return CometChatMessageList(
                  user: user,
                  stateCallBack: (messageListState) {
                    controller.messageListState = messageListState;
                  },
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
