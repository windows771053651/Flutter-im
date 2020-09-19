import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/system_message_subscribe_author_bean.dart';
import 'package:flutter_im/chat/sub_view/system_message_page_header_item.dart';

class SystemMessageHeader extends StatelessWidget {

  final List<SystemMessageSubscribeAuthorBean> _dataResources = getHeaderDataResources();

  final ScrollController _scrollController = ScrollController();

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
            controller: _scrollController,
            itemBuilder: (context, index) {
              SystemMessageSubscribeAuthorBean bean = _dataResources[index];
              double marginLeft = 0.0;
              double marginRight = 0.0;
              if (index == 0) {
                marginLeft = 16.0;
              } else if (index == _dataResources.length - 1) {
                marginLeft = 24.0;
                marginRight = 16.0;
              } else {
                marginLeft = 24.0;
              }
              return SystemMessageHeaderItem(
                iconUrl: bean.iconUrl,
                name: bean.name,
                marginLeft: marginLeft,
                marginRight: marginRight,
                scrollController: _scrollController,
              );
            },
          ),
        )
      ],
    );
  }


}