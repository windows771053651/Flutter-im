import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/image_display_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'bean/constant_enum.dart';
import 'bean/remark_settings_bean.dart';

class StrangerValidationPage extends StatefulWidget {
  @override
  State createState() => _StrangerValidationState();
}

class _StrangerValidationState extends State<StrangerValidationPage> {

  StrangerVerificationStatus _verificationStatus;

  String _name;

  bool _isFirst = true;

  String _avatarUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598891453746&di=e54fdb6d8cefa644ea1263e540ebb180&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn16%2F720%2Fw1920h1200%2F20181117%2Fe377-hnyuqhh4897269.jpg";

  @override
  Widget build(BuildContext context) {
    List arguments = ModalRoute.of(context).settings.arguments;
    if (_isFirst && arguments.length >= 2) {
      _isFirst = false;
      _verificationStatus = arguments[0];
      _name = arguments[1];
    }
    return Scaffold(
      appBar: getAppBar(
        context,
        leftCallback: () {
          Navigator.of(context).pop(_name);
        }
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 24),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TouchCallBack(
                      child: getClipRRectImage(networkUrl: _avatarUrl,),
                      pressedColor: Colors.transparent,
                      callBack: () {
                        Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_MULTI_IMAGE_DISPLAY, arguments: ImageDisplayBean(pictures: [_avatarUrl]));
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            height: 4,
                          ),
                          Text(
                            "地区：阿拉伯联合酋长国 阿布扎比",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            height: 4,
                          ),
                          Row(
                            children: <Widget>[
                              TouchCallBack(
                                child: Text(
                                  "设置备注和标签",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[700],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                callBack: () {
                                  // 设置备注和标签
                                  Future future = Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_REMARKS_SETTINGS, arguments: RemarksSettingsBean("设置备注和标签", "新的备注名称", "请填写备注名", _name, "备注名"));
                                  future.then((onValue) {
                                    if (onValue != null) {
                                      setState(() {
                                        _name = onValue;
                                      });
                                    }
                                  });
                                },
                              ),
                              Container(
                                width: 16,
                              ),
                              TouchCallBack(
                                child: Text(
                                  "朋友权限",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[700],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                callBack: () {
                                  // 朋友权限
                                  Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_FRIEND_PERMISSION_SETTINGS);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFebebeb),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFdbdbdb),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "hs：您好，这边是恒泰证券客服，有事联系你，麻烦通过一下",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8a8a8a),
                        ),
                      ),
                      Container(
                        width: 64,
                        margin: EdgeInsets.only(top: 4),
                        child: TouchCallBack(
                          normalColor: Colors.transparent,
                          child: Text(
                            "回复",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue[700],
                            ),
                          ),
                          callBack: () {
                            showReplyDialog();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 8,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                CommonTextItemView(
                  leftTitle: "好友动态",
                  callback: () {
                    Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_FRIENDS_UPDATES, arguments: [_name, _avatarUrl]);
                  },
                ),
                HorizontalLine(
                  marginLeft: 12,
                ),
                CommonTextItemView(
                  leftTitle: "来源",
                  centerText: "对方通过搜索手机号添加",
                  centerTextColor: Color(0xFF8a8a8a),
                  arrowRightIconVisible: false,
                ),
              ],
            ),
          ),
          Container(
            height: 8,
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minHeight: 50,
            ),
            child: Text(
              _getVerificationStatusText(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showReplyDialog() {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
        children: <Widget>[
         Container(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(
                 "回复",
                 style: TextStyle(
                   fontSize: 14,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(left: 12, right: 12, bottom: 24),
                 decoration: BoxDecoration(
                   border: Border(
                     bottom: BorderSide(
                       width: 0.5,
                       color: Color(0xffededed),
                     ),
                   ),
                 ),
                 child: TextField(
                   decoration: InputDecoration(
                     border: InputBorder.none,
                   ),
                 ),
               ),
               HorizontalLine(
                 height: 0.5,
               ),
               Column(
                 children: <Widget>[
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Expanded(
                         child: Container(
                           height: 42,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(2)),
                           ),
                           child: TouchCallBack(
                             bottomLeftRadius: 2,
                             child: Center(
                               child: Text(
                                 "取消",
                                 style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                             callBack: () {
                               Navigator.of(context).pop();
                             },
                           ),
                         ),
                       ),
                       Container(
                         width: 0.5,
                         height: 42,
                         color: Color(0xffededed),
                       ),
                       Expanded(
                         child: Container(
                           height: 42,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(2)),
                           ),
                           child: TouchCallBack(
                             bottomRightRadius: 2,
                             child: Center(
                               child: Text(
                                 "确定",
                                 style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.blue[700],
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                             callBack: () {
                               Navigator.of(context).pop();
                             },
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               )
             ],
           ),
         ),
        ],
      );
    });
  }

  /// 获取验证状态文本
  String _getVerificationStatusText() {
    String text = "";
    if (_verificationStatus != null) {
      if (_verificationStatus == StrangerVerificationStatus.STRANGER) {
        text = "验证通过";
      } else if (_verificationStatus == StrangerVerificationStatus.CHECKING) {
        text = "验证中";
      } else if (_verificationStatus == StrangerVerificationStatus.VALIDATION_PASSED) {
        text = "已通过";
      } else if (_verificationStatus == StrangerVerificationStatus.EXPIRED) {
        text = "已过期";
      }
    }

    return text;
  }
}