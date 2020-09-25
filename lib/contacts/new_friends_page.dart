import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'bean/constant_enum.dart';

class NewFriendsPage extends StatefulWidget {

  StrangerVerificationStatus _verificationStatus = StrangerVerificationStatus.STRANGER;

  bool _temporaryMessageVisible = true;

  @override
  State createState() => _NewFriendsState();
}

class _NewFriendsState extends State<NewFriendsPage> {

  String _name = "古力娜扎";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "新的朋友",
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 12),
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TouchCallBack(
              radius: 4,
              pressedColor: Color(0x00000000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 24,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2),
                    child: Text(
                      "微信号/手机号",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              callBack: () {
                Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_SEARCH);
              },
            ),
          ),
          Container(
            height: 8,
          ),
          CommonTextItemView(
            leftIcon: Icons.phone,
            leftIconColor: Colors.green,
            leftTitle: "添加手机联系人",
            leftTitleWidth: 180,
            titleFontSize: 16,
            callback: () {
              Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_PHONE_CONTACTS);
            },
          ),
          Visibility(
            visible: widget._temporaryMessageVisible,
            child: Container(
              margin: EdgeInsets.only(left: 12, top: 4, bottom: 4),
              child: Text(
                "三天前",
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget._temporaryMessageVisible,
            child: TouchCallBack(
              normalColor: Colors.white,
              child: Container(
                padding: EdgeInsets.only(left: 12, top: 10, right: 12, bottom: 10),
                child: Row(
                  children: <Widget>[
                    getClipRRectImage(assetPath: "images/nazha.jpg", width: 42, height: 42),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _name,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              height: 4,
                            ),
                            Text(
                              "您好，这边是恒泰证券客服，有事联系你，麻烦通过一下",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TouchCallBack(
                      radius: 2,
                      child: Container(
                        width: 72,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _getVerificationStatusBackgroundColor(),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        padding: EdgeInsets.only(left: 4, top: 2, right: 4, bottom: 2),
                        child:Text(
                          _getVerificationStatusText(),
                          style: TextStyle(
                            fontSize: 14,
                            color: _getVerificationStatusColor(),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      callBack: () {
                        setState(() {
                          widget._verificationStatus = StrangerVerificationStatus.VALIDATION_PASSED;
                        });
                      },
                    ),
                  ],
                ),
              ),
              callBack: () {
                // 跳转到个人验证页面
                Future future = Navigator.of(context).pushNamed<dynamic>(PageId.GROUP_CONTACTS_STRANGER_VALIDATION, arguments: <dynamic>[widget._verificationStatus, _name]);
                future.then((onValue) {
                  if (onValue != null) {
                    setState(() {
                      _name = onValue;
                    });
                  }
                });
              },
              longPressCallBack: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return new AlertDialog(
                        title: new Text("提示"),
                        content: new Text("是否删除该用户的临时聊天信息"),
                        contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
                        actions: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              setState(() {
                                widget._temporaryMessageVisible = false;
                              });
                              Navigator.of(context).pop();
                            },
                            child: new Text(
                              "确认",
                              style: TextStyle(
                                  color: Colors.green
                              ),
                            ),
                          ),
                          new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: new Text(
                              "取消",
                              style: TextStyle(
                                  color: Colors.green
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 获取验证状态文本背景颜色
  Color _getVerificationStatusBackgroundColor() {
    Color color = Colors.green;
    if (widget._verificationStatus != StrangerVerificationStatus.STRANGER) {
      color = Colors.transparent;
    }
    return color;
  }

  /// 获取验证状态文本字体颜色
  Color _getVerificationStatusColor() {
    Color color = Colors.white;
    if (widget._verificationStatus != StrangerVerificationStatus.STRANGER) {
      color = Colors.grey;
    }
    return color;
  }

  /// 获取验证状态文本
  String _getVerificationStatusText() {
    String text = "";
    if (widget._verificationStatus == StrangerVerificationStatus.STRANGER) {
      text = "验证通过";
    } else if (widget._verificationStatus == StrangerVerificationStatus.CHECKING) {
      text = "验证中";
    } else if (widget._verificationStatus == StrangerVerificationStatus.VALIDATION_PASSED) {
      text = "已通过";
    } else if (widget._verificationStatus == StrangerVerificationStatus.EXPIRED) {
      text = "已过期";
    }

    return text;
  }
}
