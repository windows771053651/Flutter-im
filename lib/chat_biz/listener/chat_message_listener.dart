import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat/bean/chat_session.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';

typedef InitChatMessageCallback = void Function(List<ChatMessageBean> initMessages);

typedef InitChatSessionCallback = void Function(List<ChatSession> initSessions);

typedef OnChatSessionDeleteCallback = void Function(String targetUserId);

typedef OnFriendsUpdatesCallback = void Function(List<FriendsUpdatesBean> data);

abstract class OnChatMessageUpdateListener {
  void onChatMessageUpdate(ChatMessageBean newMessages);
}
