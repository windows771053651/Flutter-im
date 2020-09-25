import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

/// 朋友圈，短连接样式
class FriendsUpdatesItemLink extends StatelessWidget {

  final FriendsUpdatesBean itemBean;

  FriendsUpdatesItemLink(this.itemBean);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          itemBean.userName,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue[700],
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
          ),
        ),
        TouchCallBack(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.all(2),
          normalColor: Color(0xffededed),
          callBack: () {
            Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_WEBVIEW_LOADING_PAGE, arguments: [itemBean.link.title, itemBean.link.link]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              getClipRRectImage(
                networkUrl: itemBean.link.icon,
                radius: 0,
                width: 36,
                height: 36,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        itemBean.link.title,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue[700],
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        itemBean.link.subTitle,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}