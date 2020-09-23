import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'friends_updates_item_link.dart';
import 'friends_updates_item_picture.dart';

class FriendsUpdatesItem extends StatelessWidget {

  final FriendsUpdatesBean itemBean;

  FriendsUpdatesItem(this.itemBean);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
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
          getClipRRectImage(
            networkUrl: itemBean.avatarUrl,
            width: 34,
            height: 34,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: _getItemWidget(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getItemWidget(BuildContext context) {
    if (itemBean.link != null) {
      return FriendsUpdatesItemLink(itemBean);
    } else {
      return FriendsUpdatesItemPicture(itemBean);
    }
  }

}