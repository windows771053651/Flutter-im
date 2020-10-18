import 'dart:async';
import 'dart:math';

import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/database/db_constant.dart';
import 'package:flutter_im/database/db_table_chat_message.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'listener/chat_message_listener.dart';
import 'message_manager.dart';

/// 两钟获取MessageControllerImpl实例对象的方法，工厂模式和instance两种单例模式
class MessageControllerImpl extends MessageManager<ChatMessageBean> {

  static MessageControllerImpl _instance;

  factory MessageControllerImpl() => _getInstance();

  static MessageControllerImpl get instance => _getInstance();

  MessageControllerImpl._internal();

  InitChatMessageCallback _initChatMessageCallback;

  List<OnChatMessageUpdateListener> _onChatMessageUpdateCallback;

  /// 聊天对象的名称
  String _name;

  String _avatarUrl;

  ImDatabaseProvider _imDatabaseProvider;

  static MessageControllerImpl _getInstance() {
    if (_instance == null) {
      _instance = MessageControllerImpl._internal();
      _instance._imDatabaseProvider = ImDatabaseProvider();
      _instance._onChatMessageUpdateCallback = List();
    }
    return _instance;
  }

  @override
  void init(String name, String avatarUrl) {
    assert(IMUtils.isStringNotEmpty(name), "注册的UI更新监听器时用户名不能为空");
    this._name = name;
    this._avatarUrl = avatarUrl;
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
    /// 存入数据库
    Future future = _imDatabaseProvider.insert(message);
    future.then((onValue) {
      print("插入:$onValue条数据");
    });
    /// 通知UI更新消息
    if (_onChatMessageUpdateCallback != null) {
      _onChatMessageUpdateCallback.forEach((OnChatMessageUpdateListener onChatMessageUpdateListener) {
        onChatMessageUpdateListener.onChatMessageUpdate(message);
      });
    } else {
      print("已注销UI更新监听器");
    }
  }

  @override
  Future<int> clearAllNativeMessage(String userId) {
    return _imDatabaseProvider.delete(userId);
  }

  @override
  void registerInitChatMessageListener(InitChatMessageCallback initChatMessageCallback) {
    assert(initChatMessageCallback != null, "注册的UI更新监听器为null");
    this._initChatMessageCallback = initChatMessageCallback;

    /// 注册UI消息变更监听器时，将本地存储的信息更新到UI显示
    /// 从数据库读取数据
    Future<List<Map<String, dynamic>>> nativeMessagesFuture = _imDatabaseProvider.query("${_name.hashCode}");
    nativeMessagesFuture.then((onValue) {
      if (onValue != null && onValue.length > 0) {
        List<ChatMessageBean> nativeMessages = List();
        onValue.forEach((Map<String, dynamic> bean) {
          ChatMessageBean chatMessageBean = ChatMessageBean.build(
            chatMessageType: getChatMessageTypeByIndex(bean[DBConstant.COLUMN_NAME_MESSAGE_TYPE]),
            targetName: bean[DBConstant.COLUMN_NAME_TARGET_NAME],
            targetAvatarUrl: bean[DBConstant.COLUMN_NAME_TARGET_AVATAR_URL],
            currentName: bean[DBConstant.COLUMN_NAME_CURRENT_NAME],
            currentAvatarUrl: bean[DBConstant.COLUMN_NAME_CURRENT_AVATAR_URL],
            time: bean[DBConstant.COLUMN_NAME_TIME],
            picturePath: bean[DBConstant.COLUMN_NAME_PICTURE_URL],
            voiceUrl: bean[DBConstant.COLUMN_NAME_VOICE_URL],
            location: bean[DBConstant.COLUMN_NAME_LOCATION],
            inOutType: getInOutTypeByIndex(bean[DBConstant.COLUMN_NAME_IN_OUT_TYPE]),
            chatMessage: bean[DBConstant.COLUMN_NAME_CONTENT],
            nativePicturePath: bean[DBConstant.COLUMN_NAME_NATIVE_PICTURE_URI],
          );
          nativeMessages.add(chatMessageBean);
        });
        _initChatMessageCallback(nativeMessages);
      }
    });
  }

  @override
  void registerChatMessageUpdateListener(OnChatMessageUpdateListener onChatMessageUpdateListener) {
    _onChatMessageUpdateCallback.add(onChatMessageUpdateListener);
  }

  @override
  void unRegisterUpdateUIListener(OnChatMessageUpdateListener onChatMessageUpdateListener) {
    this._initChatMessageCallback = null;
    this._onChatMessageUpdateCallback.remove(onChatMessageUpdateListener);
  }

  /// 自动回复一条本地消息
  _autoSendNativeMessage() {
    List<ChatMessageBean> defaultInChatMessage = getDefaultChatMessage(this._name, this._avatarUrl);
    int index = Random().nextInt(defaultInChatMessage.length);
    dispatchMessage(defaultInChatMessage[index]);
  }

}