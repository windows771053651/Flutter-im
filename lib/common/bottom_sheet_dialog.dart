import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({Key key, this.list, this.onItemClickListener})
      : assert(list != null),
        super(key: key);
  final list;
  final OnItemClickListener onItemClickListener;

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

typedef OnItemClickListener = void Function(int index);

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  OnItemClickListener onItemClickListener;
  var itemCount;
  double itemHeight = 48;

  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    int listLength = widget.list.length;

    /// 最后还有一个cancel，所以加1
    itemCount = listLength + 1;
    var height = ((listLength +1) * itemHeight + 10).toDouble();
    var cancelContainer = Container(
        height: itemHeight,
        decoration: BoxDecoration(
          color: Colors.white, // 底色
        ),
        child: TouchCallBack(
          child: Center(
            child: Text(
              "取消",
              style: TextStyle(
                  fontFamily: 'Robot',
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Color(0xff333333),
                  fontSize: 14),
            ),
          ),
          callBack: () {
            Navigator.of(context).pop();
          },
        ));
    var listView = ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (index == itemCount - 1) {
            return new Container(
              child: cancelContainer,
              margin: const EdgeInsets.only(top: 10),
            );
          }
          return getItemContainer(context, index, listLength);
        });
    var totalContainer = Container(
      child: listView,
      height: height,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: Color(0xffe5e5e5),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
    var stack = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: totalContainer,
        ),
      ],
    );
    return stack;
  }

  Widget getItemContainer(BuildContext context, int index, int listLength) {
    if (widget.list == null) {
      return Container();
    }

    var text = widget.list[index];
    var contentText = Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
          color: Color(0xFF333333),
          fontSize: 14),
    );

    var decoration;
    var center;
    var itemContainer;
    center = Center(
      child: contentText,
    );
    var onTap2 = () {
      if (onItemClickListener != null) {
        onItemClickListener(index);
      }
    };
    if (index == 0) {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        border: Border.all(width: 0.5, color: Color(0xffe5e5e5)),
      );
    } else {
      decoration = BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
      );
    }
    itemContainer = Container(
      height: itemHeight,
      decoration: decoration,
      child: center,
    );

    return TouchCallBack(
      topLeftRadius: index == 0 ? 10 : 0,
      topRightRadius: index == 0 ? 10 : 0,
      child: itemContainer,
      callBack: () {
        onTap2();
      },
    );
  }
}
