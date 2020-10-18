import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat/bean/chat_session.dart';

typedef InitChatMessageCallback = void Function(List<ChatMessageBean> initMessages);

typedef InitChatSessionCallback = void Function(List<ChatSession> initSessions);

typedef OnChatSessionDeleteCallback = void Function(String targetUserId);

abstract class OnChatMessageUpdateListener {
  void onChatMessageUpdate(ChatMessageBean newMessages);
}
