import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/indicator.dart';

/// 相册、拍摄、语音等工具箱面板组件
class ChatPageBottomToolBox extends StatefulWidget {

  List<Widget> pageList;

  ChatPageBottomToolBox({
    @required this.pageList,
  }): assert(pageList != null, "聊天页面工具箱列表数组不能为null");

  @override
  State createState() => _State();
}

class _State extends State<ChatPageBottomToolBox> {

  int _currentIndex = 0;

  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      color: Color(0xFFebebeb),
      padding: EdgeInsets.only(top: 32),
      child: Column(
        children: <Widget>[
          Expanded(
            child:
            PageView(
              physics: AlwaysScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: widget.pageList,
              controller: controller,
            ),
          ),
          Indicator(
            count: widget.pageList.length,
            index: _currentIndex,
            radius: 5,
          ),
        ],
      ),
    );
  }
}
