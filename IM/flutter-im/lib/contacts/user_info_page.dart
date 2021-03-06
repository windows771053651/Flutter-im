import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/image_display_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'bean/contact_bean.dart';
import 'bean/remark_settings_bean.dart';

class UserInfoPage extends StatefulWidget {
  @override
  State createState() => UserInfoState();
}

class UserInfoState extends State<UserInfoPage> {

  bool _isFirst = true;

  ContactVO _contactVO;

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      _contactVO = ModalRoute.of(context).settings.arguments;
    }

    return Scaffold(
      appBar: getAppBar(context),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 40),
            child: Row(
              children: <Widget>[
                TouchCallBack(
                  child: IMUtils.getClipRRectImage(networkUrl: _contactVO.avatarUrl),
                  pressedColor: Colors.transparent,
                  callBack: () {
                    Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_MULTI_IMAGE_DISPLAY, arguments: ImageDisplayBean(pictures: [_contactVO.avatarUrl]));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _contactVO.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 2,
                      ),
                      Text(
                        "账号：${_contactVO.serialNum}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
          ),
          CommonTextItemView(
            leftTitle: "设置备注和标签",
            leftTitleWidth: 200,
            callback: () {
              Future future = Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_REMARKS_SETTINGS, arguments: RemarksSettingsBean("设置备注和标签", "新的备注名称", "请填写备注名", _contactVO.name, "备注名"));
              future.then((value) {
                if (value != null) {
                  setState(() {
                    _contactVO.name = value;
                  });
                }
              });
            },
          ),
          Container(
            height: 0.5,
          ),
          CommonTextItemView(
            leftTitle: "朋友权限",
            leftTitleWidth: 200,
            callback: () {
              Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_FRIEND_PERMISSION_SETTINGS);
            },
          ),
          Container(
            height: 8,
          ),
          TouchCallBack(
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Text(
                    "好友动态",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff353535),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        _getImage(FileUtil.getImagePath("avatar_kobe_icon", format: "jpg"), marginLeft: 24),
                        _getImage(FileUtil.getImagePath("avatar_qiaoba_icon", format: "jpg")),
                        _getImage(FileUtil.getImagePath("avatar_lufei_icon", format: "jpg")),
                      ],
                    ),
                  ),
                  Image.asset(
                    FileUtil.getImagePath("icon_arrow_right"),
                    width: 16,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            callBack: () {
              Navigator.of(context).pushNamed(PageId.GROUP_FIND_FRIENDS_UPDATES, arguments: [_contactVO.name, _contactVO.avatarUrl]);
            },
          ),
          Container(
            height: 8,
          ),
          TouchCallBack(
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(FileUtil.getImagePath("icon_user_info_message"), width: 20, height: 20, fit: BoxFit.cover,),
                  Container(width: 8,),
                  Text(
                    "发消息",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ),
            callBack: () {
              Navigator.of(context).pushNamed(PageId.GROUP_CHAT_CHAT_PAGE, arguments: [_contactVO.name, _contactVO.avatarUrl]);
            },
          ),
          Container(
            height: 0.5,
          ),
          TouchCallBack(
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(FileUtil.getImagePath("icon_user_info_audio"), width: 20, height: 20, fit: BoxFit.cover,),
                  Container(width: 8,),
                  Text(
                    "音视频通话",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ),
            callBack: () {

            },
          ),
        ],
      ),
    );
  }

  Widget _getImage(String path, {double marginLeft = 8}) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      child: Image.asset(path, width: 40, height: 40, fit: BoxFit.cover,),
    );
  }
}