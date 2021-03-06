import 'package:flutter_im/chat/bean/chat_session.dart';
import 'package:flutter_im/chat_biz/session_manager.dart';
import 'package:flutter_im/database/provider/db_table_chat_session.dart';
import 'package:flutter_im/database/table/chat_session_table.dart';

import '../chat_biz/listener/chat_message_listener.dart';

class SessionManagerImpl extends SessionManager {

  static SessionManagerImpl _instance;

  factory SessionManagerImpl() => _getInstance();

  static SessionManagerImpl get instance => _getInstance();

  SessionManagerImpl._internal();

  ImSessionDatabaseProvider _imSessionDatabaseProvider;

  OnChatSessionDeleteCallback _onChatSessionDeleteCallback;

  static SessionManagerImpl _getInstance() {
    if (_instance == null) {
      _instance = SessionManagerImpl._internal();
      _instance._imSessionDatabaseProvider = ImSessionDatabaseProvider();
    }
    return _instance;
  }

  @override
  Future<int> deleteSession(String targetUserId) {
    _imSessionDatabaseProvider.delete(targetUserId);
    if (_onChatSessionDeleteCallback != null) {
      _onChatSessionDeleteCallback(targetUserId);
    }
  }

  @override
  void insertSession(ChatSession session) {
    assert(session != null, "聊天session为null");
    /// 存入数据库
    Future future = _imSessionDatabaseProvider.insert(session);
    future.then((onValue) {
      print("插入session:$onValue条数据");
    });
  }

  @override
  void registerInitChatSessionListener(InitChatSessionCallback initChatSessionCallback) {
    /// 注册UI消息变更监听器时，将本地存储的信息更新到UI显示
    /// 从数据库读取数据
    Future<List<Map<String, dynamic>>> nativeSessionFuture = _imSessionDatabaseProvider.query("");
    nativeSessionFuture.then((onValue) {
      if (onValue != null && onValue.length > 0) {
        List<ChatSession> nativeSessions = List();
        for (int i = onValue.length - 1; i >=0; i--) {
          Map<String, dynamic> bean = onValue[i];
          ChatSession chatMessageBean = ChatSession(
            name: bean[ChatSessionTable.COLUMN_NAME_NAME],
            avatar: bean[ChatSessionTable.COLUMN_NAME_AVATAR],
            messageType: getMessageType(bean[ChatSessionTable.COLUMN_NAME_TYPE]),
            time: DateTime.fromMillisecondsSinceEpoch(bean[ChatSessionTable.COLUMN_NAME_DATETIME]),
            read: bean[ChatSessionTable.COLUMN_NAME_READ] == 1,
            lastChatMessageContent: bean[ChatSessionTable.COLUMN_NAME_LAST_CHAT_MESSAGE],
          );
          nativeSessions.add(chatMessageBean);
        }
        initChatSessionCallback(nativeSessions);
      }
    });
  }

  void registerOnSessionDeletedLister(OnChatSessionDeleteCallback onChatSessionDeleteCallback) {
    this._onChatSessionDeleteCallback = onChatSessionDeleteCallback;
  }
}