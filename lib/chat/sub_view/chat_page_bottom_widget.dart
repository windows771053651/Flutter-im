import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_emoji.dart';
import 'package:flutter_im/chat_biz/message_manager_impl.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/personal_constant.dart';

import 'chat_page_bottom_tools_box/chat_page_bottom_tool_box.dart';
import 'chat_page_bottom_tools_box/tools_box_first_page.dart';
import 'chat_page_bottom_tools_box/tools_box_second_page.dart';

/// 聊天页面底部组件
class ChatBottomWidget extends StatefulWidget {

  final ListViewScrollToBottomController scrollToBottomController;

  ChatBottomWidget({
    Key key,
    this.scrollToBottomController,
  }): super(key: key);

  @override
  State createState() => ChatBottomState();
}

class ChatBottomState extends State<ChatBottomWidget> {
  TextEditingController _textEditingController;

  FocusNode _focusNode;

  /// 控制发送按钮的显示
  bool _sendBtnVisible = false;

  /// 控制录音按钮的显示
  bool _recordVoiceBtnVisible = false;

  /// 底部工具箱是否显示
  bool _toolsBoxVisible = false;

  /// 底部emoji是否显示
  bool _emojiViewVisible = false;

  /// 是否可以显示软键盘。当emoji view显示时，软键盘不可以弹出，否则可以弹出
  bool _keyboardEnableVisible = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_toolsBoxVisible || _focusNode.hasFocus) {
        setState(() {
          _toolsBoxVisible = false;
          _emojiViewVisible = false;
        });
      }
    });
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {
        _sendBtnVisible = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFebebeb),
            border: Border(
              top: BorderSide(
                width: 0.5,
                color: Color(0xffcdcdcd),
              ),
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xffcdcdcd),
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              _getBottomIcon(
                assetPath: "images/chat_voice_icon.png",
                left: 6,
                callback: () {
                  setState(() {
                    _recordVoiceBtnVisible = !_recordVoiceBtnVisible;
                    _toolsBoxVisible = false;
                    _emojiViewVisible = false;
                    _keyboardEnableVisible = true;
                    if (!_recordVoiceBtnVisible) {
                      /// 下一帧绘制完成时弹起软键盘
                      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
                        FocusScope.of(context).requestFocus(_focusNode);
                      });
                    }
                  });
                },
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(
                    minHeight: 36,
                  ),
                  margin: EdgeInsets.only(top: 6, bottom: 6),
                  padding: EdgeInsets.only(left: 6, right: 6),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: _getRecordVoiceWidget(),
                ),
              ),
              _getBottomIcon(
                assetPath: _emojiViewVisible ? "images/hide_soft_keyboard_icon.png" : "images/chat_emoji_icon.png",
                left: 6,
                callback: () {
                  _recordVoiceBtnVisible = false;
                  if (!_emojiViewVisible) {
                    setState(() {
                      _keyboardEnableVisible = false;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
                      FocusScope.of(context).requestFocus(_focusNode);
                      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
                        setState(() {
                          if (_emojiViewVisible) {
                            _emojiViewVisible = false;
                            _keyboardEnableVisible = true;
                          } else {
                            _toolsBoxVisible = false;
                            _keyboardEnableVisible = false;
                            Future.delayed(Duration(milliseconds: 100), () {
                              setState(() {
                                _emojiViewVisible = true;
                              });
                            });
                          }
                        });
                      });
                    });
                  } else {
                    setState(() {
                      _emojiViewVisible = false;
                      _keyboardEnableVisible = true;
                    });
                    FocusScope.of(context).requestFocus(_focusNode);
                  }
                },
              ),
              _getRightSendAddWidget(),
            ],
          ),
        ),
        (_toolsBoxVisible || _emojiViewVisible)
            ? Container(
                height: 240,
                child: _bottomWidget(),
              )
              : SizedBox(
                  height: 0,
                )
      ],
    );
  }

  /// 底部可控显示区域
  Widget _bottomWidget() {
    Widget widget;
    if (_toolsBoxVisible) {
      widget = ChatPageBottomToolBox(
        pageList: [
          ToolBoxFirstPage(),
          ToolsBoxSecondPage(),
        ],
      );
    } else if (_emojiViewVisible) {
      widget = ChatPageBottomEmoji((String emoji) {
        _textEditingController.text = _textEditingController.text + emoji;
      });
    }
    return widget;
  }

  /// 录音按钮和文本编辑框
  Widget _getRecordVoiceWidget() {
    return _recordVoiceBtnVisible
        ? Center(
            child: Text(
              "按住 说话",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          )
        : TextField(
            focusNode: _focusNode,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(0),
            ),
            maxLines: 3,
            minLines: 1,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            textAlignVertical: TextAlignVertical.center,
            controller: _textEditingController,
            showCursor: true,
            readOnly: !_keyboardEnableVisible,
          );
  }

  /// 发送按钮、加号组件
  Widget _getRightSendAddWidget() {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: !_sendBtnVisible,
          child: _getBottomIcon(
            assetPath: "images/chat_add_icon.png",
            callback: () {
              _hideKeyBoard();
              if (_emojiViewVisible) {
                setState(() {
                  _toolsBoxVisible = true;
                  _emojiViewVisible = false;
                  _keyboardEnableVisible = true;
                  widget.scrollToBottomController();
                });
              } else {
                Future.delayed(Duration(milliseconds: 100), () {
                  setState(() {
                    _toolsBoxVisible = true;
                    _emojiViewVisible = false;
                    _keyboardEnableVisible = true;
                    widget.scrollToBottomController();
                  });
                });
              }
            },
          ),
        ),
        Visibility(
          visible: _sendBtnVisible,
          child: TouchCallBack(
            radius: 2,
            normalColor: Colors.green,
            pressedColor: Colors.green[700],
            margin: EdgeInsets.only(right: 6),
            padding: EdgeInsets.only(left: 14, top: 6, right: 14, bottom: 6),
            child: Text(
              "发送",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            callBack: () {
              _sendMessage();
              _textEditingController.clear();
            },
          ),
        ),
      ],
    );
  }

  Widget _getBottomIcon({
    String assetPath,
    VoidCallback callback,
    double left = 0,
  }) {
    return TouchCallBack(
      normalColor: Colors.transparent,
      pressedColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: left, right: 6, top: 4, bottom: 4),
        child: Image.asset(
          assetPath,
          width: 26,
          height: 26,
          fit: BoxFit.cover,
          color: Color(0xff2c2c2c),
        ),
      ),
      callBack: callback,
    );
  }

  /// 发送文本消息
  void _sendMessage() {
    MessageControllerImpl.instance.sendMessage(ChatMessageBean.build(
      name: PersonalConstant.userName,
      chatMessageType: ChatMessageType.TEXT,
      avatarUrl: PersonalConstant.userAvatar,
      inOutType: InOutType.OUT,
      chatMessage: _textEditingController.text,
    ));
  }

  /// 关闭底部view和键盘
  void closeBottomWidgetAndKeyBoard() {
    _hideKeyBoard();
    setState(() {
      _toolsBoxVisible = false;
      _emojiViewVisible = false;
    });
  }

  /// 关闭软键盘
  void _hideKeyBoard() {
    _focusNode.unfocus();
  }
}

typedef ListViewScrollToBottomController = Function();
