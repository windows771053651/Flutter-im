
import 'package:flutter_im/chat/bean/chat_session.dart';

import 'listener/chat_message_listener.dart';

abstract class SessionManager<T extends ChatSession> {
  Future<int> deleteSession(String targetUserId);

  void insertSession(ChatSession session);

  void registerInitChatSessionListener(InitChatSessionCallback initChatSessionCallback);
}