import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/tools_box_item_bean.dart';
import 'package:flutter_im/common/touch_callback.dart';

abstract class ToolsBoxItemFactoryImpl {
  Widget product(ToolsBoxItemBean bean);

  List<Widget> productSeries(List<ToolsBoxItemBean> params);
}

class ToolsBoxItemFactory implements ToolsBoxItemFactoryImpl {

  @override
  Widget product(ToolsBoxItemBean bean) {
    return _getItemView(bean);
  }

  @override
  List<Widget> productSeries(List<ToolsBoxItemBean> params) {
    assert(params != null, "工具箱渲染所需示例对象数组不能为null");
    return List.generate(params.length, (index) {
      return product(params[index]);
    });
  }

  Widget _getItemView(ToolsBoxItemBean bean) {
    assert(bean != null, "工具箱渲染所需示例对象不能为null");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TouchCallBack(
          normalColor: Colors.white70,
          radius: 10,
          callBack: bean.callback,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: bean.cellSize,
            height: bean.cellSize,
            child: Icon(bean.iconData,),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            bean.label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}