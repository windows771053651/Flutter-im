import 'dart:async';
import 'dart:math';

import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/personal/personal_constant.dart';
import 'package:flutter_im/profiler/db/db_constant.dart';
import 'package:flutter_im/profiler/db/db_table_chat_message.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'listener/chat_message_listener.dart';
import 'message_manager.dart';

/// 两钟获取MessageControllerImpl实例对象的方法，工厂模式和instance两种单例模式
class MessageControllerImpl extends MessageManager<ChatMessageBean> {

  static MessageControllerImpl _instance;

  factory MessageControllerImpl() => _getInstance();

  static MessageControllerImpl get instance => _getInstance();

  MessageControllerImpl._internal();

  IUpdateUIListener _listener;

  /// 聊天对象的名称
  String _name;

  String _avatarUrl;

  ImDatabaseProvider _imDatabaseProvider;

  static MessageControllerImpl _getInstance() {
    if (_instance == null) {
      _instance = MessageControllerImpl._internal();
      _instance._imDatabaseProvider = ImDatabaseProvider();
    }
    return _instance;
  }

  @override
  void sendMessage(ChatMessageBean message) {
    assert(message != null, "消息对象message为null");
    print("发送消息:${message.toString()}");
    /// 直接走本地发送消息
    dispatchMessage(message);

    Timer(Duration(milliseconds: 200), () {
      /// 自动回复一条消息
      _autoSendNativeMessage();
    });
  }

  @override
  void dispatchMessage(ChatMessageBean message) {
    assert(message != null, "消息对象message为null");
    message.userId = "${_name.hashCode}${PersonalConstant.userName.hashCode}";
    /// 存入数据库
    Future future = _imDatabaseProvider.insert(message);
    future.then((onValue) {
      print("插入:$onValue条数据");
    });
    /// 通知UI更新消息
    if (_listener != null) {
      _listener(null, message);
    } else {
      print("已注销UI更新监听器");
    }
  }

  @override
  Future<int> clearAllNativeMessage(String userId) {
    return _imDatabaseProvider.delete(userId + "${PersonalConstant.userName.hashCode}");
  }

  @override
  void registerUpdateUIListener(IUpdateUIListener listener, String name, String avatarUrl) {
    assert(listener != null, "注册的UI更新监听器为null");
    assert(isStringNotEmpty(name), "注册的UI更新监听器时用户名不能为空");
    this._listener = listener;
    this._name = name;
    this._avatarUrl = avatarUrl;

    /// 注册UI消息变更监听器时，将本地存储的信息更新到UI显示
    /// 从数据库读取数据
    Future<List<Map<String, dynamic>>> nativeMessagesFuture = _imDatabaseProvider.query("${_name.hashCode}${PersonalConstant.userName.hashCode}");
    nativeMessagesFuture.then((onValue) {
      if (onValue != null && onValue.length > 0) {
        List<ChatMessageBean> nativeMessages = List();
        onValue.forEach((Map<String, dynamic> bean) {
          String avatarUrlIn = bean[DBConstant.columnNameAvatarUrl];
          String nameIn = bean[DBConstant.columnNameName];
          InOutType inOutType = getInOutTypeByIndex(bean[DBConstant.columnNameInOutType]);
          if (inOutType == InOutType.IN) {
            avatarUrlIn = this._avatarUrl;
            nameIn = this._name;
          }
          ChatMessageBean chatMessageBean = ChatMessageBean.build(
            chatMessageType: getChatMessageTypeByIndex(bean[DBConstant.columnNameMessageType]),
            avatarUrl: avatarUrlIn,
            name: nameIn,
            time: bean[DBConstant.columnNameTime],
            picturePath: bean[DBConstant.columnNamePictureUrl],
            voiceUrl: bean[DBConstant.columnNameVoiceUrl],
            location: bean[DBConstant.columnNameLocation],
            inOutType: inOutType,
            chatMessage: bean[DBConstant.columnNameMessageContent],
            nativePicturePath: bean[DBConstant.columnNameNativePictureUri],
          );
          nativeMessages.add(chatMessageBean);
        });
        _listener(nativeMessages, null);
      }
    });
  }

  @override
  void unRegisterUpdateUIListener() {
    this._listener = null;
  }

  /// 自动回复一条本地消息
  _autoSendNativeMessage() {
    List<ChatMessageBean> defaultInChatMessage = getDefaultChatMessage(this._name, this._avatarUrl);
    int index = Random().nextInt(defaultInChatMessage.length);
    dispatchMessage(defaultInChatMessage[index]);
  }

}