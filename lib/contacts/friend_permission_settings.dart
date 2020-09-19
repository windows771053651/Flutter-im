import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';

class FriendPermissionSettings extends StatefulWidget {

  bool selected = true;

  bool switchOn1 = true;

  bool switchOn2 = false;

  @override
  State createState() => _FriendPermissionSettingsState();
}

class _FriendPermissionSettingsState extends State<FriendPermissionSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          context,
          leftTitle: "朋友权限"
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 12, top: 12),
            child: Text(
              "设置朋友权限",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            height: 8,
          ),
          CommonTextItemView(
            leftTitle: "聊天、好友动态、运动等",
            leftTitleWidth: 180,
            arrowRightIconVisible: widget.selected,
            arrowRightIconAssetPath: "images/icon_selected.png",
            arrowRightIconSize: 32,
            callback: () {
              if (!widget.selected) {
                setState(() {
                  widget.selected = true;
                });
              }
            },
          ),
          Container(
            height: 0.5,
          ),
          CommonTextItemView(
            leftTitle: "仅聊天",
            arrowRightIconVisible: !widget.selected,
            arrowRightIconAssetPath: "images/icon_selected.png",
            arrowRightIconSize: 32,
            callback: () {
              if (widget.selected) {
                setState(() {
                  widget.selected = false;
                });
              }
            },
          ),
          Visibility(
            visible: widget.selected,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 12, top: 12),
                  child: Text(
                    "好友动态和视频动态",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: 8,
                ),
                _getSwitchItem("不让她看我", true),
                Container(
                  height: 0.5,
                ),
                _getSwitchItem("不看她", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSwitchItem(String leftTitle, bool isSwitchOn1) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      height: 50,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              leftTitle,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff353535),
              ),
            ),
          ),
          CupertinoSwitch(
            value: isSwitchOn1 ? widget.switchOn1 : widget.switchOn2,
            onChanged: (value) {
              setState(() {
                if (isSwitchOn1) {
                  widget.switchOn1 = value;
                } else {
                  widget.switchOn2 = value;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}