import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/tools_box_item_bean.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_tools_box/tools_box_item_factory.dart';

class FirstPage extends StatelessWidget {

  ToolsBoxItemFactoryImpl toolsBoxItemFactoryImpl;

  FirstPage() {
    toolsBoxItemFactoryImpl = ToolsBoxItemFactory();
  }

  @override
  Widget build(BuildContext context) {

    double cellSize = MediaQuery.of(context).size.width / 7.6;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo, "相册", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo_camera, "拍摄", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.video_call, "视频通话", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo, "位置", cellSize, () {

            })),
          ],
        ),
        Container(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.attach_money, "红包", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.transform, "转账", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.settings_voice, "语音输入", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.collections, "我的收藏", cellSize, () {

            })),
          ],
        ),
      ],
    );
  }
}
