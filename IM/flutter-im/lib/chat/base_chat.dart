import 'package:flutter/cupertino.dart';
import 'package:flutter_im/chat_biz/listener/chat_message_listener.dart';
import 'package:flutter_im/database/message_manager_impl.dart';

/// 消息类State基类，监听原生的回调，更新页面
abstract class MessageState<T extends StatefulWidget> extends State<T> implements OnChatMessageUpdateListener {
  @override
  void initState() {
    super.initState();
    _addListener();
  }

  @override
  void dispose() {
    MessageControllerImpl.instance.unRegisterUpdateUIListener(this);
    super.dispose();
  }

  _addListener() {
    MessageControllerImpl.instance.registerChatMessageUpdateListener(this);
  }
}
