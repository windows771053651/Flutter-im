import 'package:flutter/cupertino.dart';
import 'package:flutter_im/constants/constants.dart';
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

  /// 聊天对象的姓名
  final String targetName;

  /// 聊天对象的头像
  final String targetAvatarUrl;

  /// 当前对象的姓名
  final String currentName;

  /// 当前用户的头像
  final String currentAvatarUrl;

  final String time;

  final String picturePath;

  final String voiceUrl;

  final String location;

  final InOutType inOutType;

  final String chatMessage;

  final String nativePicturePath;

  /// 聊天对象的uiserid
  String targetUserId;

  /// 当前用户的uiserid
  String currentUserId;

  static ChatMessageBean build({
    @required String targetName,
    @required String currentName,
    @required ChatMessageType chatMessageType,
    @required String currentAvatarUrl,
    @required String targetAvatarUrl,
    @required InOutType inOutType,
    String chatMessage,
    String picturePath,
    String nativePicturePath,
    String time = "15:01",
    String voiceUrl,
    String location,
  }) {
    assert(chatMessageType != null, "请指定消息类型");
    assert(chatMessageType != ChatMessageType.TEXT || (chatMessageType == ChatMessageType.TEXT && IMUtils.isStringNotEmpty(chatMessage)), "请指定发送文本内容");
    assert(chatMessageType != ChatMessageType.PICTURE
            || (chatMessageType == ChatMessageType.PICTURE && (IMUtils.isStringNotEmpty(picturePath) || IMUtils.isStringNotEmpty(nativePicturePath))), "发送图片地址信息错误");

    return ChatMessageBean(
      targetName: targetName,
      targetAvatarUrl: targetAvatarUrl,
      currentName: currentName,
      currentAvatarUrl: currentAvatarUrl,
      chatMessageType: chatMessageType,
      time: time,
      inOutType: inOutType,
      chatMessage: chatMessage,
      picturePath: picturePath,
      nativePicturePath: nativePicturePath,
      voiceUrl: voiceUrl,
      location: location,
    );
  }

  ChatMessageBean({
    this.chatMessageType,
    @required this.targetName,
    @required this.currentName,
    this.targetAvatarUrl,
    this.currentAvatarUrl,
    this.time,
    this.picturePath,
    this.voiceUrl,
    this.location,
    this.inOutType,
    this.chatMessage,
    this.nativePicturePath,
  }) {
    assert(IMUtils.isStringNotEmpty(this.targetName), "聊天消息用户名不能为空");
    this.targetUserId = "${this.targetName.hashCode}";
    this.currentUserId = "${this.currentName.hashCode}";
  }

  @override
  String toString() {
    return 'ChatMessageBean{chatMessageType: $chatMessageType, name: $targetName, time: $time, inOutType: $inOutType, chatMessage: $chatMessage}';
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
      currentName: Constants.userName,
      currentAvatarUrl: Constants.userAvatar,
      targetName: name,
      targetAvatarUrl: avatar,
      chatMessageType: ChatMessageType.TEXT,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "炒股必亏",
    ),
    ChatMessageBean(
      currentName: Constants.userName,
      currentAvatarUrl: Constants.userAvatar,
      targetName: name,
      targetAvatarUrl: avatar,
      chatMessageType: ChatMessageType.TEXT,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "必亏啊",
    ),
    ChatMessageBean(
      currentName: Constants.userName,
      currentAvatarUrl: Constants.userAvatar,
      targetName: name,
      targetAvatarUrl: avatar,
      chatMessageType: ChatMessageType.PICTURE,
      time: "15:01",
      inOutType: InOutType.IN,
      picturePath: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2143033927,6164022&fm=26&gp=0.jpg",
    ),
    ChatMessageBean(
      currentName: Constants.userName,
      currentAvatarUrl: Constants.userAvatar,
      targetName: name,
      targetAvatarUrl: avatar,
      chatMessageType: ChatMessageType.TEXT,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "必亏啊，兄弟",
    ),
  ];
}
