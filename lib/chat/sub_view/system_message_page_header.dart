import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/system_message_subscribe_author_bean.dart';
import 'package:flutter_im/utils/im_tools.dart';

class SystemMessageHeader extends StatelessWidget {

  final List<SystemMessageSubscribeAuthorBean> _dataResources = getHeaderDataResources();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12, top: 8),
          child: Text(
            "常读的订阅号",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4, bottom: 4),
          height: 80,
          child: ListView.builder(
            itemCount: _dataResources.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              SystemMessageSubscribeAuthorBean bean = _dataResources[index];
              if (index == 0) {
                return _getSubscribeTab(bean.iconUrl, bean.name, marginLeft: 16);
              } else if (index == _dataResources.length - 1) {
                return _getSubscribeTab(bean.iconUrl, bean.name, marginLeft: 24, marginRight: 16);
              } else {
                return _getSubscribeTab(bean.iconUrl, bean.name, marginLeft: 24);
              }
            },
          ),
        )
      ],
    );
  }

  Widget _getSubscribeTab(String iconUrl, String name, {double marginLeft = 0, double marginRight = 0}) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          getClipRRectImage(networkUrl: iconUrl, width: 44, height: 44, radius: 44 / 2),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF707070),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}