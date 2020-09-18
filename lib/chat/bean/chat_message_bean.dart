import 'package:flutter/cupertino.dart';
import 'package:flutter_im/utils/im_tools.dart';

enum ChatMessageType {
  TEXT,           /// 文本类型
  VOICE,          /// 语音
  PICTURE,        /// 图片
  LOCATION,       /// 定位
  RED_ENVELOPES,  /// 红包
  CARD,           /// 明信片
}

enum InOutType {
  IN,             /// 发送进来的消息
  OUT,            /// 向外发出的消息
}

class ChatMessageBean {
  final ChatMessageType chatMessageType;

  final String avatarUrl;

  final String name;

  final String time;

  final String picturePath;

  final String voiceUrl;

  final String location;

  final InOutType inOutType;

  final String chatMessage;

  final String nativePicturePath;

  String userId;

  ChatMessageBean({
    this.chatMessageType,
    this.avatarUrl,
    @required this.name,
    this.time,
    this.picturePath,
    this.voiceUrl,
    this.location,
    this.inOutType,
    this.chatMessage,
    this.nativePicturePath,
  }) {
    assert(isStringNotEmpty(this.name), "聊天消息用户名不能为空");
    this.userId = "${this.name.hashCode}";
  }

  static ChatMessageBean build({
    @required String name,
    @required ChatMessageType chatMessageType,
    @required String avatarUrl,
    @required InOutType inOutType,
    String chatMessage,
    String picturePath,
    String nativePicturePath,
    String time = "15:01",
    String voiceUrl,
    String location,
  }) {
    assert(chatMessageType != null, "请指定消息类型");
    assert(chatMessageType != ChatMessageType.TEXT || (chatMessageType == ChatMessageType.TEXT && isStringNotEmpty(chatMessage)), "请指定发送文本内容");
    assert(chatMessageType != ChatMessageType.PICTURE
            || (chatMessageType == ChatMessageType.PICTURE && (isStringNotEmpty(picturePath) || isStringNotEmpty(nativePicturePath))), "发送图片地址信息错误");

    return ChatMessageBean(
      name: name,
      chatMessageType: chatMessageType,
      avatarUrl: avatarUrl,
      time: time,
      inOutType: inOutType,
      chatMessage: chatMessage,
      picturePath: picturePath,
      nativePicturePath: nativePicturePath,
      voiceUrl: voiceUrl,
      location: location,
    );
  }

  @override
  String toString() {
    return 'ChatMessageBean{chatMessageType: $chatMessageType, name: $name, time: $time, inOutType: $inOutType, chatMessage: $chatMessage}';
  }
}

ChatMessageType getChatMessageTypeByIndex(int index) {
  switch(index) {
    case 0:
      return ChatMessageType.TEXT;
    case 1:
      return ChatMessageType.VOICE;
    case 2:
      return ChatMessageType.PICTURE;
    case 3:
      return ChatMessageType.LOCATION;
    case 4:
      return ChatMessageType.RED_ENVELOPES;
    case 5:
      return ChatMessageType.CARD;
    default:
      return ChatMessageType.TEXT;
  }
}

InOutType getInOutTypeByIndex(int index) {
  switch(index) {
    case 0:
      return InOutType.IN;
    case 1:
      return InOutType.OUT;
    default:
      return InOutType.IN;
  }
}

List<ChatMessageBean> getDefaultChatMessage(String name, String avatar) {
  return [
    ChatMessageBean(
      name: name,
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: avatar,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "炒股必亏",
    ),
    ChatMessageBean(
      name: name,
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: avatar,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "必亏啊",
    ),
    ChatMessageBean(
      name: name,
      chatMessageType: ChatMessageType.PICTURE,
      avatarUrl: avatar,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "扣我880分，返还我40分",
      picturePath: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2143033927,6164022&fm=26&gp=0.jpg",
    ),
    ChatMessageBean(
      name: name,
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: avatar,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "必亏啊，兄弟",
    ),
  ];
}
