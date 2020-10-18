import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_session.dart';
import 'package:flutter_im/chat/sub_view/message_item.dart';
import 'package:flutter_im/chat_biz/session_manager_impl.dart';
import 'package:flutter_im/constants/sp_keys.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:flutter_im/utils/sp_util.dart';

import 'base_chat.dart';
import 'bean/chat_message_bean.dart';

class MessagePage extends StatefulWidget {
  @override
  State createState() => _MessagePageState();
}

class _MessagePageState extends MessageState<MessagePage> {

  List<ChatSession> _dataResources = List();

  @override
  void initState() {
    super.initState();
    bool hasLoadedDefaultChatSession = SPUtil.getBool(ConstantsSPKeys.SP_KEYS_LOAD_DEFAULT_CHAT_SESSION);
    if (hasLoadedDefaultChatSession == null || !hasLoadedDefaultChatSession) {
      SPUtil.putBool(ConstantsSPKeys.SP_KEYS_LOAD_DEFAULT_CHAT_SESSION, true);
      ChatSession defaultSession = getDefaultMessageData();
      SessionManagerImpl.instance.insertSession(defaultSession);
    }
    SessionManagerImpl.instance.registerInitChatSessionListener((List<ChatSession> initSessions) {
      setState(() {
        _dataResources.addAll(initSessions);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _dataResources.length,
          itemBuilder: (BuildContext context, int index) {
            return MessageItem(_dataResources[index], onContextMenuSelected: (ChatSession chatSession, ContextMenuEnum type) {
              if (type == ContextMenuEnum.READ_STATE) {
                setState(() {
                  chatSession.read = !chatSession.read;
                });
              } else if (type == ContextMenuEnum.MESSAGE_TOPPING) {
                setState(() {
                  _dataResources.remove(chatSession);
                  _dataResources.insert(0, chatSession);
                });
              } else if (type == ContextMenuEnum.DELETE_MESSAGE) {
                setState(() {
                  _dataResources.remove(chatSession);
                });
                SessionManagerImpl.instance.deleteSession(chatSession.userId);
              }
            },);
          }
      ),
    );
  }

  @override
  void onChatMessageUpdate(ChatMessageBean newMessages) {
    ChatSession session;
    if (newMessages != null) {
      session = _getTargetSession(newMessages);
      if (session != null) {
        _dataResources.remove(session);
      } else {
        session = _newChatSession(newMessages);
      }
      setState(() {
        _dataResources.insert(0, session);
      });
      SessionManagerImpl.instance.insertSession(session);
    }
  }

  ChatSession _newChatSession(ChatMessageBean newMessages) {
    String messageContent;
    if (newMessages.chatMessageType == ChatMessageType.PICTURE) {
      messageContent = "[图片]";
    } else if (newMessages.chatMessageType == ChatMessageType.TEXT) {
      messageContent = newMessages.chatMessage;
    }
    ChatSession chatSession = ChatSession(
      name: newMessages.targetName,
      avatar: newMessages.targetAvatarUrl,
      lastChatMessageContent: messageContent,
      messageType: MessageType.CHAT,
      time: DateTime.now(),
      read: true,
    );
    return chatSession;
  }

  ChatSession _getTargetSession(ChatMessageBean newMessages) {
    ChatSession target;
    for (ChatSession session in _dataResources) {
      if (IMUtils.compareString(session.userId, newMessages.targetUserId)) {
        String messageContent;
        if (newMessages.chatMessageType == ChatMessageType.PICTURE) {
          messageContent = "[图片]";
        } else if (newMessages.chatMessageType == ChatMessageType.TEXT) {
          messageContent = newMessages.chatMessage;
        }
        target = session;
        target.lastChatMessageContent = messageContent;
        target.time = DateTime.now();
        break;
      }
    }

    return target;
  }
}