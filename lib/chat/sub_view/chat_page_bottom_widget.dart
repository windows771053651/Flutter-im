import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_emoji.dart';
import 'package:flutter_im/database/message_manager_impl.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/utils/file_util.dart';

import 'chat_page_bottom_tools_box/chat_page_bottom_tool_box.dart';
import 'chat_page_bottom_tools_box/tools_box_first_page.dart';
import 'chat_page_bottom_tools_box/tools_box_second_page.dart';
import 'package:flutter_im/utils/im_tools.dart';

/// 聊天页面底部组件
class ChatBottomWidget extends StatefulWidget {

  final ListViewScrollToBottomController scrollToBottomController;

  final String targetName;

  final String targetAvatarUrl;

  ChatBottomWidget(this.targetName, this.targetAvatarUrl, {
        Key key,
        this.scrollToBottomController,
      }): super(key: key);

  @override
  State createState() => ChatBottomState();
}

class ChatBottomState extends State<ChatBottomWidget> {

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

  String _inputContent = "";

  GlobalKey _inputGlobalKey = GlobalKey();

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
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: _bottomBody(),
      onPointerDown: (enter) {
        if (_isShouldDisplaySoftKeyboard(enter) && _emojiViewVisible) {
          setState(() {
            _keyboardEnableVisible = true;
            _toolsBoxVisible = false;
            _emojiViewVisible = false;
          });
        }
      },
    );
  }

  /// 点击Widget，触屏点是否在目标范围内
  bool _isShouldDisplaySoftKeyboard(PointerDownEvent enter) {
    Offset offset = IMUtils.getWidgetPosition2(_inputGlobalKey);
    Size size = IMUtils.getWidgetSize(_inputGlobalKey);
    double right = offset.dx + size.width;
    double bottom = offset.dy + size.height;
    return enter.position.dx >= offset.dx && enter.position.dx <= right && enter.position.dy >= offset.dy && enter.position.dy <= bottom;
  }

  Widget _bottomBody() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: IMColors.c_FFebebeb,
            border: Border(
              top: BorderSide(
                width: 0.5,
                color: IMColors.c_ffcdcdcd,
              ),
              bottom: BorderSide(
                width: 0.5,
                color: IMColors.c_ffcdcdcd,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              _getVoiceWidget(),
              _getRecordVoiceWidget(),
              _getEmojiWidget(),
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

  Widget _getVoiceWidget() {
    return _getBottomIcon(
      assetPath: FileUtil.getImagePath("chat_voice_icon"),
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
    );
  }

  /// 录音按钮和文本编辑框
  Widget _getRecordVoiceWidget() {
    return Expanded(
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
        child: _recordVoiceBtnVisible
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
                key: _inputGlobalKey,
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
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: _inputContent,
                    selection: TextSelection.fromPosition(
                      TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: _inputContent.length,
                      ),
                    ),
                  ),
                ),
                showCursor: true,
                readOnly: !_keyboardEnableVisible,
                onChanged: (value) {
                  _inputContent = value;
                  setState(() {
                    _sendBtnVisible = value.isNotEmpty;
                  });
                },
              ),
      ),
    );
  }

  Widget _getEmojiWidget() {
    return _getBottomIcon(
      assetPath: _emojiViewVisible ? FileUtil.getImagePath("hide_soft_keyboard_icon") : FileUtil.getImagePath("chat_emoji_icon"),
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
    );
  }

  /// 发送按钮、加号组件
  Widget _getRightSendAddWidget() {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: !_sendBtnVisible,
          child: _getBottomIcon(
            assetPath: FileUtil.getImagePath("chat_add_icon"),
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
              setState(() {
                _inputContent = "";
                _sendBtnVisible = false;
              });
            },
          ),
        ),
      ],
    );
  }

  /// 底部可控显示区域
  Widget _bottomWidget() {
    Widget bottomWidget;
    if (_toolsBoxVisible) {
      bottomWidget = ChatPageBottomToolBox(
        pageList: [
          ToolBoxFirstPage(widget.targetName, widget.targetAvatarUrl),
          ToolsBoxSecondPage(),
        ],
      );
    } else if (_emojiViewVisible) {
      bottomWidget = ChatPageBottomEmoji(
        onEmojiAdded: (String emoji) {
          setState(() {
            _inputContent = _inputContent + emoji;
            _sendBtnVisible = _inputContent.isNotEmpty;
          });
        },
        onEmojiDelete: () {
          setState(() {
            _inputContent = deleteInputContent(_inputContent);
            _sendBtnVisible = _inputContent.isNotEmpty;
          });
        },
      );
    }
    return bottomWidget;
  }

  /// 将输入框内容转成unicode编码，从后往前每次删除一个unicode，达到删除文本内容的目的
  String deleteInputContent(String str) {
    int unitLen = 1;
    var sRunes = str.runes;
    return sRunes.length >= unitLen ?  String.fromCharCodes(sRunes, 0, sRunes.length - unitLen) : str;
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
                color: IMColors.c_ff2c2c2c,
        ),
      ),
      callBack: callback,
    );
  }

  /// 发送文本消息
  void _sendMessage() {
    MessageControllerImpl.instance.sendMessage(ChatMessageBean.build(
      targetName: widget.targetName,
      targetAvatarUrl: widget.targetAvatarUrl,
      currentName: Constants.userName,
      currentAvatarUrl: Constants.userAvatar,
      chatMessageType: ChatMessageType.TEXT,
      inOutType: InOutType.OUT,
      chatMessage: _inputContent,
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

  bool isBottomWidgetVisible() {
    return _toolsBoxVisible || _emojiViewVisible;
  }

  /// 关闭软键盘
  void _hideKeyBoard() {
    _focusNode.unfocus();
  }
}

typedef ListViewScrollToBottomController = Function();
