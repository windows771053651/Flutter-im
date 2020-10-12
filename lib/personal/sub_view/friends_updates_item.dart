import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'friends_updates_item_link.dart';
import 'friends_updates_item_picture.dart';

class FriendsUpdatesItem extends StatelessWidget {

  final FriendsUpdatesBean itemBean;

  FriendsUpdatesItem(this.itemBean);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xfff5f5f5),
          )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IMUtils.getClipRRectImage(
            networkUrl: itemBean.avatarUrl,
            width: 34,
            height: 34,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _getItemWidget(context),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            itemBean.time,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        TouchCallBack(
                          child: Image.asset(FileUtil.getImagePath("menu_ellipsie2_icon"), width: 24, height: 16,),
                          normalColor: Color(0x10000000),
                          radius: 2,
                          callBack: () {
                            _displayOptionMenu();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _displayOptionMenu() {

  }

  Widget _getItemWidget(BuildContext context) {
    if (itemBean.link != null) {
      return FriendsUpdatesItemLink(itemBean);
    } else {
      return FriendsUpdatesItemPicture(itemBean);
    }
  }

}