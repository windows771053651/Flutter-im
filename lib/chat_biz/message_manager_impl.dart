import 'dart:async';
import 'dart:math';

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

  String _name;

  String _avatarUrl;

  static MessageControllerImpl _getInstance() {
    if (_instance == null) {
      _instance = MessageControllerImpl._internal();
    }
    return _instance;
  }

  @override
  void sendMessage(ChatMessageBean message) {
    assert(message != null, "消息对象message为null");
    print(message.toString());
    /// 直接走本地发送消息
    if (_listener != null) {
      _listener(message);
    }

    Timer(Duration(milliseconds: 200), () {
      _autoSendPictureMessage();
    });
  }

  @override
  void dispatchMessage(ChatMessageBean message) {
    assert(message != null, "消息对象message为null");
    if (_listener != null) {
      _listener(message);
    }
  }

  @override
  void registerUpdateUIListener(IUpdateUIListener listener, String name, String avatarUrl) {
    assert(listener != null, "注册的UI更新监听器为null");
    this._listener = listener;
    this._name = name;
    this._avatarUrl = avatarUrl;
  }

  /// 自动发送一条本地图片消息
  _autoSendPictureMessage() {
    ChatMessageBean chatMessageBean = ChatMessageBean.build(
      name: _name,
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl:_avatarUrl,
      inOutType: InOutType.IN,
      chatMessage: _getChatMessageText(),
    );
    dispatchMessage(chatMessageBean);
  }

  _getChatMessageText() {
    List<String> paths = [
      "炒股必亏",
      "必亏啊",
      "必亏啊，兄弟",
    ];

    int index = Random().nextInt(paths.length);
    return paths[index];
  }
}