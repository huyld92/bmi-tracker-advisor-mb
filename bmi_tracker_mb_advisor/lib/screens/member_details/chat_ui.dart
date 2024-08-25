import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  Messages(this.accountID, this.fullName, this.accountPhoto, {super.key});

  String accountID;
  String fullName;
  String accountPhoto;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages>
    with CometChatMessageEventListener {
  String listenerID = "unique_listener_ID";

  @override
  void initState() {
    super.initState();

    CometChatMessageEvents.addMessagesListener(
        listenerID, this); // Add the listener
  }

  @override
  void dispose() {
    super.dispose();

    CometChatConversationEvents.removeConversationListListener(
        listenerID); // Remove the listener
  }

  @override
  void onTextMessageReceived(TextMessage textMessage) {
    print('textMessage:$textMessage');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CometChatMessages(
      messageComposerConfiguration: const MessageComposerConfiguration(
        hideVoiceRecording: true,
      ),
      user: User.fromUID(
        uid: widget.accountID,
        name: widget.fullName,
        avatar: widget.accountPhoto,
      ),
      hideDetails: true,
    ) // A user or group object is required to launch this widget.
            ));
  }
}
