import 'package:flutter_im/chat/bean/chat_message_bean.dart';

import 'listener/chat_message_listener.dart';
import 'message_manager.dart';

/// 两钟获取MessageControllerImpl实例对象的方法，工厂模式和instance两种单例模式
class MessageControllerImpl extends MessageManager<ChatMessageBean> {

  static MessageControllerImpl _instance;

  factory MessageControllerImpl() => _getInstance();

  static MessageControllerImpl get instance => _getInstance();

  MessageControllerImpl._internal();

  IUpdateUIListener _listener;

  static MessageControllerImpl _getInstance() {
    if (_instance == null) {
      _instance = MessageControllerImpl._internal();
    }
    return _instance;
  }

  void sendMessage(ChatMessageBean message) {
    assert(message != null, "消息对象message为null");
    print(message.toString());
    /// 直接走本地发送消息
    if (_listener != null) {
      _listener(message);
    }
  }

  void dispatchMessage(ChatMessageBean message) {
    assert(message != null, "消息对象message为null");
  }

  void registerUpdateUIListener(IUpdateUIListener listener) {
    assert(listener != null, "注册的UI更新监听器为null");
    this._listener = listener;
  }
}