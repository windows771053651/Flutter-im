import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/search_app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<SearchPage> {

  String _searchContent = "";

  FocusNode _focusNode;

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
        setState(() {
          _searchContent = text;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    return Scaffold(
      appBar: SearchAppBarWidget(
          focusNode: _focusNode,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
          ),
        controller: TextEditingController.fromValue(
          TextEditingValue(
            // 输入的文本
            text: _searchContent,
            // 保持光标在最后
            selection: TextSelection.fromPosition(
              TextPosition(
                affinity: TextAffinity.downstream,
                offset: _searchContent.length,
              ),
            ),
          ),
        ),
        onChanged: (value) {
          _searchContent = value;
        },
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 32, top: 20),
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
                  _getTabText("古力娜扎"),
                  _getTabText("男生"),
                  _getTabText("女生"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}