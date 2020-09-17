
enum MessageType { SYSTEM, CHAT, GROUP }

class MessageData {
  String avatar;
  String title;
  String subTitle;
  MessageType messageType;
  DateTime time;

  bool read = true;

  MessageData(this.avatar, this.title, this.subTitle, this.messageType, this.time, this.read);
}

getMessageData() {
  return [
    MessageData(
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3562085980,3663429241&fm=26&gp=0.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977798093&di=7fd0c6c68597d6d793dc0bce1f197f16&imgtype=0&src=http%3A%2F%2F05.imgmini.eastday.com%2Fmobile%2F20170824%2F20170824112844_af679c07e86c4451b17b004f72b3590a_23.jpeg",
        "科比",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600338206842&di=cb0a03014bf9ceb0595df668fa4adf53&imgtype=0&src=http%3A%2F%2Fwww.ipschool.net%2Fuploads%2Fallimg%2F200204%2F120124C57-1.png",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3562085980,3663429241&fm=26&gp=0.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977798093&di=7fd0c6c68597d6d793dc0bce1f197f16&imgtype=0&src=http%3A%2F%2F05.imgmini.eastday.com%2Fmobile%2F20170824%2F20170824112844_af679c07e86c4451b17b004f72b3590a_23.jpeg",
        "科比",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600338206842&di=cb0a03014bf9ceb0595df668fa4adf53&imgtype=0&src=http%3A%2F%2Fwww.ipschool.net%2Fuploads%2Fallimg%2F200204%2F120124C57-1.png",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3562085980,3663429241&fm=26&gp=0.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977798093&di=7fd0c6c68597d6d793dc0bce1f197f16&imgtype=0&src=http%3A%2F%2F05.imgmini.eastday.com%2Fmobile%2F20170824%2F20170824112844_af679c07e86c4451b17b004f72b3590a_23.jpeg",
        "科比",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600338206842&di=cb0a03014bf9ceb0595df668fa4adf53&imgtype=0&src=http%3A%2F%2Fwww.ipschool.net%2Fuploads%2Fallimg%2F200204%2F120124C57-1.png",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3562085980,3663429241&fm=26&gp=0.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977798093&di=7fd0c6c68597d6d793dc0bce1f197f16&imgtype=0&src=http%3A%2F%2F05.imgmini.eastday.com%2Fmobile%2F20170824%2F20170824112844_af679c07e86c4451b17b004f72b3590a_23.jpeg",
        "科比",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600338206842&di=cb0a03014bf9ceb0595df668fa4adf53&imgtype=0&src=http%3A%2F%2Fwww.ipschool.net%2Fuploads%2Fallimg%2F200204%2F120124C57-1.png",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3562085980,3663429241&fm=26&gp=0.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977798093&di=7fd0c6c68597d6d793dc0bce1f197f16&imgtype=0&src=http%3A%2F%2F05.imgmini.eastday.com%2Fmobile%2F20170824%2F20170824112844_af679c07e86c4451b17b004f72b3590a_23.jpeg",
        "科比",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600338206842&di=cb0a03014bf9ceb0595df668fa4adf53&imgtype=0&src=http%3A%2F%2Fwww.ipschool.net%2Fuploads%2Fallimg%2F200204%2F120124C57-1.png",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),

  ];
}
