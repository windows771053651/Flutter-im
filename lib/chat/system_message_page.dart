import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/system_message_bean.dart';
import 'package:flutter_im/chat/sub_view/system_message_item.dart';
import 'package:flutter_im/chat/sub_view/system_message_page_header.dart';
import 'package:flutter_im/common/app_bar.dart';

class SystemMessagePage extends StatelessWidget {

  List<SystemMessageBean> dataResource = getSystemMessageData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "订阅号消息",
      ),
      body: Container(
        child: ListView.builder(
          itemCount: dataResource.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return SystemMessageHeader();
            } else {
              return SystemMessageItem(data: dataResource[index - 1],);
            }
          },
        ),
      ),
    );
  }

}
