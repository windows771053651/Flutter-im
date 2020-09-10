import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat_biz/message_manager.dart';
import 'package:flutter_im/common/touch_callback.dart';

import 'chat_page_bottom_tools_box/chat_page_bottom_tool_box.dart';
import 'chat_page_bottom_tools_box/tools_box_first_page.dart';
import 'chat_page_bottom_tools_box/tools_box_second_page.dart';

/// 聊天页面底部组件
class ChatBottomWidget extends StatefulWidget {

  MessageManager _messageManager;

  ChatBottomWidget(
    this._messageManager,
  ) : assert(_messageManager != null, "必须指定消息发送器");

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

  /// 底部工具箱显示
  bool _toolsBoxVisible = false;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_toolsBoxVisible || _focusNode.hasFocus) {
        setState(() {
          _toolsBoxVisible = false;
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
          height: 46,
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
                  });
                },
              ),
              Expanded(
                child: Container(
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
                assetPath: "images/chat_emoji_icon.png",
                left: 6,
                callback: () {

                },
              ),
              _getRightSendAddWidget(),
            ],
          ),
        ),
        Visibility(
          visible: _toolsBoxVisible,
          child: ChatPageBottomToolBox(
            pageList: [
              ToolBoxFirstPage(),
              ToolsBoxSecondPage(),
            ],
          ),
        ),
      ],
    );
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
            ),
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            textAlignVertical: TextAlignVertical.center,
            controller: _textEditingController,
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
              _focusNode.unfocus();
              setState(() {
                _toolsBoxVisible = true;
              });
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
              widget._messageManager.sendMessage(ChatMessageBean.build(
                name: "一休",
                chatMessageType: ChatMessageType.TEXT,
                avatarUrl:
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599128582535&di=9807439e68f649516e0c981f0f6ae910&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120627%2FImg346630529.jpg",
                inOutType: InOutType.OUT,
                chatMessage: _textEditingController.text,
              ));
              _textEditingController.clear();
            },
          ),
        ),
      ],
    );
  }

  Widget _getBottomIcon(
      {String assetPath, VoidCallback callback, double left = 0}) {
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
}
