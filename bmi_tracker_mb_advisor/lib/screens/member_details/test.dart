import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';

class MessageEventsExample extends StatefulWidget {
  const MessageEventsExample({super.key});

  @override
  State<MessageEventsExample> createState() => _MessageEventsExampleState();
}

class _MessageEventsExampleState extends State<MessageEventsExample>
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
  void ccMessageSent(BaseMessage message, MessageStatus messageStatus) {
    print('BaseMessage:$message');
  }

  @override
  void ccMessageEdited(BaseMessage message, MessageEditStatus status) {
    // TODO("Not yet implemented")
  }

  @override
  void ccMessageDeleted(BaseMessage message, EventStatus messageStatus) {
    // TODO("Not yet implemented")
  }

  @override
  void ccMessageRead(BaseMessage message) {
    // TODO("Not yet implemented")
  }

  @override
  void ccLiveReaction(String reaction) {
    // TODO("Not yet implemented")
  }

  @override
  void onTextMessageReceived(TextMessage textMessage) {
    print('textMessage:$textMessage');
  }

  @override
  void onMediaMessageReceived(MediaMessage mediaMessage) {
    // TODO("Not yet implemented")
  }

  @override
  void onCustomMessageReceived(CustomMessage customMessage) {
    // TODO("Not yet implemented")
  }

  @override
  void onTypingStarted(TypingIndicator typingIndicator) {
    // TODO("Not yet implemented")
  }

  @override
  void onTypingEnded(TypingIndicator typingIndicator) {
    // TODO("Not yet implemented")
  }

  @override
  void onMessagesDelivered(MessageReceipt messageReceipt) {
    // TODO("Not yet implemented")
  }

  @override
  void onMessagesRead(MessageReceipt messageReceipt) {
    // TODO("Not yet implemented")
  }

  @override
  void onMessageEdited(BaseMessage message) {
    // TODO("Not yet implemented")
  }

  @override
  void onMessageDeleted(BaseMessage message) {
    // TODO("Not yet implemented")
  }

  @override
  void onTransientMessageReceived(TransientMessage message) {
    // TODO("Not yet implemented")
  }

  @override
  void onFormMessageReceived(FormMessage formMessage) {
    // TODO("Not yet implemented")
  }

  @override
  void onCardMessageReceived(CardMessage cardMessage) {
    // TODO("Not yet implemented")
  }

  @override
  void onCustomInteractiveMessageReceived(
      CustomInteractiveMessage customInteractiveMessage) {
    // TODO("Not yet implemented")
  }

  @override
  void onInteractionGoalCompleted(InteractionReceipt receipt) {
    // TODO("Not yet implemented")
  }

  @override
  void onSchedulerMessageReceived(SchedulerMessage schedulerMessage) {
    // TODO("Not yet implemented")
  }

  @override
  void onMessageReactionAdded(ReactionEvent reactionEvent) {
    // TODO("Not yet implemented")
  }

  @override
  void onMessageReactionRemoved(ReactionEvent reactionEvent) {
    // TODO("Not yet implemented")
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
