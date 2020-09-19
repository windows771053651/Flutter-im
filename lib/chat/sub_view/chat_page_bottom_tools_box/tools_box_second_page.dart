import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/tools_box_item_bean.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_tools_box/tools_box_item_factory.dart';

class ToolsBoxSecondPage extends StatelessWidget {

  ToolsBoxItemFactoryImpl toolsBoxItemFactoryImpl;

  ToolsBoxSecondPage() {
    toolsBoxItemFactoryImpl = ToolsBoxItemFactory();
  }

  @override
  Widget build(BuildContext context) {

    double _cellSize = MediaQuery.of(context).size.width / 7.6;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.person, "名片", _cellSize, () {

        })),
        toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.attach_file, "文件", _cellSize, () {

        })),
        Container(width: _cellSize, height: _cellSize,),
        Container(width: _cellSize, height: _cellSize,),
      ],
    );
  }
}
