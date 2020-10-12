
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/sub_view/chat_item.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_widget.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'bean/chat_message_bean.dart';
import '../chat_biz/message_manager_impl.dart';
import 'chat_settings_page.dart';

/// listview倒置，因此读取数据是也是倒序。由于读取数据时是倒序的，所以消息数据的存储，分发，接收流程依然按照顺序方式处理
class ChatPage extends StatefulWidget {
  @override
  State createState() => _ChatState();
}

class _ChatState extends State<ChatPage> with WidgetsBindingObserver {

  ScrollController _scrollController;

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  List<ChatMessageBean> _chatMessage = List();

  File _backgroundImageFile = File("");

  GlobalKey _bottomWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    MessageControllerImpl.instance.unRegisterUpdateUIListener();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        if (visible) {
          _scrollToBottom();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      _initParams();
    }
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: _name,
        actions: [
          _getAppBarActionsMenu(),
        ],
      ),
      body: _body(),
    );
  }

  void _initParams() {
    List<String> arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null && arguments.length == 2) {
      _name = arguments[0];
      _avatarUrl = arguments[1];
      MessageControllerImpl.instance.registerUpdateUIListener((List<ChatMessageBean> initMessages, ChatMessageBean receivedMessage) {
        if (initMessages != null && initMessages.length > 0) {
          setState(() {
            _chatMessage.addAll(initMessages);
          });
        } else if (receivedMessage != null) {
          setState(() {
            _chatMessage.add(receivedMessage);
          });
          _scrollToBottom();
        }
      }, _name, _avatarUrl);
    }
  }

  Widget _getAppBarActionsMenu() {
    return TouchCallBack(
      normalColor: Colors.transparent,
      pressedColor: Colors.green[700],
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Image.asset(FileUtil.getImagePath("menu_ellipsie_icon"), width: 32,),
      callBack: () {
        Future future = Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_SETTINGS_PAGE, arguments: _name);
        future.then((onValue) {
          if (onValue != null) {
            List params = onValue;
            if (params.length == 2) {
              OperationType operationType = params[0];
              if (operationType == OperationType.SETTINGS_BACKGROUND) {
                setState(() {
                  /// 设置聊天背景
                  _backgroundImageFile = onValue[1];
                });
              } else if (operationType == OperationType.DELETE_CHAT_MESSAGE) {
                int count = onValue[1];
                if (count > 0) {
                  setState(() {
                    /// 清空聊天消息
                    _chatMessage.clear();
                  });
                }
              }
            }
          }
        });
      },
    );
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(_backgroundImageFile),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: TouchCallBack(
              pressedColor: Colors.transparent,
              normalColor: Colors.transparent,
              child: CupertinoScrollbar(
                child: ScrollConfiguration(
                  behavior: CusBehavior(),
                  child: _getChatListView(),
                ),
              ),
              onTouchDownCallBack: () {
                ChatBottomState chatBottomState = _bottomWidgetKey.currentState;
                chatBottomState.closeBottomWidgetAndKeyBoard();
              },
            ),
          ),
          ChatBottomWidget(
            key: _bottomWidgetKey,
            scrollToBottomController: () {
              _scrollToBottom();
            },
          ),
        ],
      ),
    );
  }

  Widget _getChatListView() {
    return ListView.builder(
      reverse: true,
      controller: _scrollController,
      itemCount: _chatMessage.length,
      itemBuilder: (context, index) {
        return ChatItemWidget(
          index: _chatMessage.length - index - 1,
          controller: (index) {
            return _chatMessage[index];
          },
          chatMessageBean: _chatMessage[_chatMessage.length - index - 1],
          lastItemDividerHeight: (index == 0) ? 12 : 0,
        );
      },
    );
  }

  /// 滚动到底部，0,0就是底部（因为是反向的）
  _scrollToBottom() {
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 100),
    );
  }
}

class CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) return child;
    return super.buildViewportChrome(context, child, axisDirection);
  }
}