import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/im_tools.dart';

class SearchPage extends StatelessWidget {

  _getTabText(String text) {
    return TouchCallBack(
      radius: 4,
      child: Container(
        width: 80,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffd8d8d8),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
      callBack: () {
        // 点击事件
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                TouchCallBack(
                  normalColor: Colors.transparent,
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.only(left: 12, right: 10),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  callBack: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 10),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.green),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          focusNode: requestFocusNode(context),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          onChanged: (value) {

                          },
                          decoration: InputDecoration(
                            hintText: "请输入搜索内容",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "常用搜索",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffb5b5b5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _getTabText("朋友"),
                  _getTabText("聊天"),
                  _getTabText("群组"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _getTabText("Flutter"),
                  _getTabText("Dart"),
                  _getTabText("C++"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}