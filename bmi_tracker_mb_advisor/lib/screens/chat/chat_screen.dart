import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

import 'chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

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
              child: CometChatMessages(
        messageComposerConfiguration: const MessageComposerConfiguration(
          hideVoiceRecording: true,
        ),
        user: controller.user,
        hideDetails: true,
        messageListView: (user, group, context) {
          return CometChatMessageList(
            user: user,
            stateCallBack: (messageListState) {
              controller.messageListState = messageListState;
            },
          );
        },
      )));
    });
  }
}
