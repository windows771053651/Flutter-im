
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
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "一休哥",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "一休哥",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "一休哥",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "一休哥",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "一休哥",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "订阅号消息",
        "刀锋2020：明天，A股要见证历史了！",
        MessageType.SYSTEM,
        DateTime.now(),
        false,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "一休哥",
        "突然想到的",
        MessageType.CHAT,
        DateTime.now(),
      true,
    ),
    MessageData(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598183189345&di=7f90b3ab5e8a4950d982bfd5d527811a&imgtype=0&src=http%3A%2F%2Fcrawl.ws.126.net%2Fimg%2Fa5574f2eb8697740f099ec4e92787bd9.jpg",
        "装逼分享群",
        "今天苹果要大涨了",
        MessageType.GROUP,
        DateTime.now(),
        false,
    ),
  ];
}
