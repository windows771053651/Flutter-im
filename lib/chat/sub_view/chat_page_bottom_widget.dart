
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat_biz/message_manager.dart';
import 'package:flutter_im/common/touch_callback.dart';

class ChatBottomWidget extends StatefulWidget {

  MessageManager _messageManager;

  ChatBottomWidget(
    this._messageManager,
  ): assert(_messageManager != null, "必须指定消息发送器");

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

  @override
  void initState() {
    _focusNode = FocusNode();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Color(0xFFebebeb),
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Color(0xffcdcdcd),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          getBottomIcon(
              assetPath: "images/chat_voice_icon.png",
              left: 6,
              callback: () {
                setState(() {
                  _recordVoiceBtnVisible = !_recordVoiceBtnVisible;
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
              child: getRecordVoiceWidget(),
            ),
          ),
          getBottomIcon(
            assetPath: "images/chat_emoji_icon.png",
            left: 6,
            callback: () {

            },
          ),
          getRightSendAddWidget(),
        ],
      ),
    );
  }

  Widget getRecordVoiceWidget() {
    return _recordVoiceBtnVisible ?
      Center(
        child: Text(
          "按住 说话",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ) :
      TextField(
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

  Widget getRightSendAddWidget() {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: !_sendBtnVisible,
          child: getBottomIcon(
            assetPath: "images/chat_add_icon.png",
            callback: () {

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
            padding: EdgeInsets.only(left: 12, top: 6, right: 12, bottom: 6),
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
                avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599128582535&di=9807439e68f649516e0c981f0f6ae910&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120627%2FImg346630529.jpg",
                inOutType: InOutType.OUT,
                chatMessage: _textEditingController.text,
              ));
            },
          ),
        ),
      ],
    );
  }

  Widget getBottomIcon({String assetPath, VoidCallback callback, double left = 0}) {
    return TouchCallBack(
      normalColor: Colors.transparent,
      pressedColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: left, right: 6, top: 4, bottom: 4),
        child: Image.asset(assetPath, width: 26, height: 26, fit: BoxFit.cover, color: Color(0xff2c2c2c),),
      ),
      callBack: callback,
    );
  }
}