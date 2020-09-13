
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977836277&di=ca8a5494227e8f3571bf458c0c800786&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F334f0f7623de11f6562a48674b6f9a5ae391bed7226e-BV8hXZ_fw236",
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977836277&di=ca8a5494227e8f3571bf458c0c800786&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F334f0f7623de11f6562a48674b6f9a5ae391bed7226e-BV8hXZ_fw236",
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977836277&di=ca8a5494227e8f3571bf458c0c800786&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F334f0f7623de11f6562a48674b6f9a5ae391bed7226e-BV8hXZ_fw236",
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977836277&di=ca8a5494227e8f3571bf458c0c800786&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F334f0f7623de11f6562a48674b6f9a5ae391bed7226e-BV8hXZ_fw236",
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977836277&di=ca8a5494227e8f3571bf458c0c800786&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F334f0f7623de11f6562a48674b6f9a5ae391bed7226e-BV8hXZ_fw236",
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599977836277&di=ca8a5494227e8f3571bf458c0c800786&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F334f0f7623de11f6562a48674b6f9a5ae391bed7226e-BV8hXZ_fw236",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
  ];
}
