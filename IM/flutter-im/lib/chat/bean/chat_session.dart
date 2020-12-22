import 'package:flutter_im/utils/im_tools.dart';

enum MessageType { SYSTEM, CHAT, GROUP }

class ChatSession {
  final String name;

  final String avatar;

  final MessageType messageType;

  DateTime time;

  bool read;

  String userId;

  String lastChatMessageContent;

  ChatSession({
    this.name,
    this.avatar,
    this.lastChatMessageContent,
    this.messageType,
    this.time,
    this.read = true,
  }){
    assert(IMUtils.isStringNotEmpty(this.name), "聊天消息用户名不能为空");
    this.userId = "${this.name.hashCode}";
  }

  @override
  String toString() {
    return 'ChatSession{name: $name, avatar: $avatar, messageType: $messageType, time: $time, read: $read, userId: $userId, lastChatMessageContent: $lastChatMessageContent}';
  }

}

MessageType getMessageType(int index) {
  switch(index) {
    case 0:
      return MessageType.SYSTEM;
    case 1:
      return MessageType.CHAT;
    default:
      return MessageType.GROUP;
  }
}

getDefaultMessageData() {
  return ChatSession(
    name: "订阅号消息",
    avatar: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3562085980,3663429241&fm=26&gp=0.jpg",
    lastChatMessageContent: "刀锋2020：明天，A股要见证历史了！",
    messageType: MessageType.SYSTEM,
    time: DateTime.now(),
    read: false,
  );
}
