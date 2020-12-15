import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';

/// 评论组件，例如朋友圈评论
class InputBottomWidget extends StatefulWidget {

  static final double BOTTOM_HEIGHT = 46;

  final ValueChanged onEditingCompleteText;

  InputBottomWidget({this.onEditingCompleteText});

  @override
  State createState() => _State();
}

class _State extends State<InputBottomWidget> with WidgetsBindingObserver {

  TextEditingController controller;

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        double bottom = MediaQuery.of(context).viewInsets.bottom;
        if (bottom == 0) {
          // 关闭键盘
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Column(
        children: <Widget>[
          Expanded(
              child: TouchCallBack(
                pressedColor: Colors.transparent,
                normalColor: Colors.transparent,
                child: Container(
                  color: Colors.transparent,
                ),
                onTouchDownCallBack: () {
                  Navigator.pop(context);
                },
              )
          ),
          new Container(
              color: Color(0xFFF4F4F4),
              height: InputBottomWidget.BOTTOM_HEIGHT,
              padding: EdgeInsets.only(left: 16,top: 8,bottom: 8,right: 16),
              child:  Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  //设置键盘按钮为发送
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.multiline,
                  onEditingComplete: (){
                    //点击发送调用
                    widget.onEditingCompleteText(controller.text);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    hintText: '请输入评论的内容',
                    isDense: true,
                    contentPadding: EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 10),
                    border: const OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  minLines: 1,
                  maxLines: 5,
                ),
              )
          )
        ],
      ),
    );
  }
}