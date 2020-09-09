
import 'package:flutter_im/chat/bean/chat_message_bean.dart';

import 'listener/chat_message_listener.dart';

abstract class MessageManager<T extends ChatMessageBean> {
  /// 发送、接收消息队列最大长度
  static const int MessageQueueMaxLen = 10;

  /// 存储外发消息，逐条发送
  List<T> _outMessageQueue = List(MessageQueueMaxLen);

  /// 存储接收消息，由分发线程负责操作，以免阻塞造成卡顿
  List<T> _inMessageQueue = List(MessageQueueMaxLen);

  List<T> get outMessageQueue => _outMessageQueue;

  set outMessageQueue(List<T> value) {
    _outMessageQueue = value;
  }

  List<T> get inMessageQueue => _inMessageQueue;

  set inMessageQueue(List<T> value) {
    _inMessageQueue = value;
  }

  /// 发送消息，由本地发出
  void sendMessage(T message);

  /// 分发消息：
  /// 1：处理消息(包括去除重复消息、错误消息、无法识别的消息等)
  /// 2：分发消息到消息队列，由分发线程负责分发(防止同时达到N多消息，阻塞线程造成卡顿)
  /// 3：分发线程向下分发消息(具体指向数据库中存储消息)
  /// 4：向上分发消息到UI层，完成UI绘制
  void dispatchMessage(T message);

  void registerUpdateUIListener(IUpdateUIListener listener);
}