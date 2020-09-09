import 'package:flutter/cupertino.dart';

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
  ChatMessageType chatMessageType;

  String avatarUrl;

  String name;

  String time;

  String picturePath;

  String voiceUrl;

  String location;

  InOutType inOutType;

  String chatMessage;

  ChatMessageBean({
    this.chatMessageType,
    this.avatarUrl,
    this.name,
    this.time,
    this.picturePath,
    this.voiceUrl,
    this.location,
    this.inOutType,
    this.chatMessage,
  });

  static ChatMessageBean build({
    @required String name,
    @required ChatMessageType chatMessageType,
    @required String avatarUrl,
    @required InOutType inOutType,
    String chatMessage,
    String picturePath,
  }) {
    assert(chatMessageType != null, "请指定消息类型");
    assert(chatMessageType != ChatMessageType.TEXT || (chatMessageType == ChatMessageType.TEXT && chatMessage != null && chatMessage.isNotEmpty), "请指定发送文本内容");
    assert(chatMessageType != ChatMessageType.PICTURE || (chatMessageType == ChatMessageType.PICTURE && picturePath != null && picturePath.isNotEmpty), "发送图片地址信息错误");

    return ChatMessageBean(
      name: name,
      chatMessageType: chatMessageType,
      avatarUrl: avatarUrl,
      time: "15:01",
      inOutType: inOutType,
      chatMessage: chatMessage,
      picturePath: picturePath,
    );
  }

  @override
  String toString() {
    return 'ChatMessageBean{chatMessageType: $chatMessageType, name: $name, time: $time, inOutType: $inOutType, chatMessage: $chatMessage}';
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
      chatMessage: "我的信用分申诉成功，返还了",
    ),
    ChatMessageBean(
      name: name,
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: avatar,
      time: "15:01",
      inOutType: InOutType.IN,
      chatMessage: "扣我880分，返还我40分",
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
      name: "一休",
      chatMessageType: ChatMessageType.PICTURE,
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599128582535&di=9807439e68f649516e0c981f0f6ae910&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120627%2FImg346630529.jpg",
      time: "15:10",
      inOutType: InOutType.OUT,
      picturePath: "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3629057141,3827316573&fm=26&gp=0.jpg",
    ),
    ChatMessageBean(
      name: "一休",
      chatMessageType: ChatMessageType.PICTURE,
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599128582535&di=9807439e68f649516e0c981f0f6ae910&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120627%2FImg346630529.jpg",
      time: "15:10",
      inOutType: InOutType.OUT,
      picturePath: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599131491109&di=bdfc64a7dee96ca643eee22904b7fe4e&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201510%2F16%2F20151016145515_KysGr.jpeg",
    ),
    ChatMessageBean(
      name: "一休",
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599128582535&di=9807439e68f649516e0c981f0f6ae910&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120627%2FImg346630529.jpg",
      time: "15:10",
      inOutType: InOutType.OUT,
      chatMessage: "放弃吧",
    ),
    ChatMessageBean(
      name: name,
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: avatar,
      time: "15:11",
      inOutType: InOutType.IN,
      chatMessage: "我继续申诉",
    ),
    ChatMessageBean(
      name: "一休",
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599128582535&di=9807439e68f649516e0c981f0f6ae910&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120627%2FImg346630529.jpg",
      time: "15:11",
      inOutType: InOutType.OUT,
      chatMessage: "你这被坐实了，哈哈",
    ),
  ];
}
