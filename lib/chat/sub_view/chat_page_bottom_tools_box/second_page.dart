import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/tools_box_item_bean.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_tools_box/tools_box_item_factory.dart';

class SecondPage extends StatelessWidget {

  ToolsBoxItemFactoryImpl toolsBoxItemFactoryImpl;

  SecondPage() {
    toolsBoxItemFactoryImpl = ToolsBoxItemFactory();
  }

  @override
  Widget build(BuildContext context) {

    double cellSize = MediaQuery.of(context).size.width / 7.6;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.person, "名片", cellSize, () {

        })),
        toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.attach_file, "文件", cellSize, () {

        })),
        Container(width: cellSize, height: cellSize,),
        Container(width: cellSize, height: cellSize,),
      ],
    );
  }
}
