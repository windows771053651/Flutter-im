
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';

class ChatBottomWidget extends StatefulWidget {

  bool sendBtnVisible = false;

  @override
  State createState() => ChatBottomState();
}

class ChatBottomState extends State<ChatBottomWidget> {

  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {
        widget.sendBtnVisible = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
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
              child: TextField(
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
              ),
            ),
          ),
          getBottomIcon(
            assetPath: "images/chat_emoji_icon.png",
            left: 6,
            callback: () {

            },
          ),
          Stack(
            children: <Widget>[
              Visibility(
                visible: !widget.sendBtnVisible,
                child: getBottomIcon(
                  assetPath: "images/chat_add_icon.png",
                  callback: () {

                  },
                ),
              ),
              Visibility(
                visible: widget.sendBtnVisible,
                child: TouchCallBack(
                  radius: 2,
                  normalColor: Colors.green,
                  pressedColor: Colors.green[700],
                  margin: EdgeInsets.only(right: 6),
                  padding: EdgeInsets.only(left: 12, top: 4, right: 12, bottom: 4),
                  child: Text(
                    "发送",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  callBack: () {

                  },
                ),
              ),
            ],
          ),
        ],
      ),
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