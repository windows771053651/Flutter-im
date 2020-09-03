import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/utils/im_tools.dart' show getWidgetPosition;

OverlayEntry _overlayEntry;

///
/// 以蒙层的方式显示在context关联的widget上。
/// 原理：
/// 1）蒙层处理
///    每push一个页面或dialog都会产生一个OverlayEntry与之对应，而OverlayEntry由Overlay
///    管理，因此添加蒙层就是插入一个OverlayEntry，删除OverlayEntry则去掉蒙层。
/// 2）点击Widget相对于父Widget的位置
///    采用RenderBox确定，参考方法 [getWidgetPosition]
/// 3）蒙层位置确定
///    由CustomSingleChildLayout决定

void showLayer(BuildContext context, List<Widget> children) {
  OverlayState overlayState = Overlay.of(context);
  final Rect widgetPosition = getWidgetPosition(context);
  _overlayEntry = _createContextMenuOverlayEntry(widgetPosition, children);
  overlayState.insert(
    _overlayEntry,
  );
}

void _removeOverlay() {
  _overlayEntry?.remove();
  _overlayEntry = null;
}

_createContextMenuOverlayEntry(Rect widgetPosition, List<Widget> children) {
  return OverlayEntry(
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: _removeOverlay,
        child: Material(
          color: Colors.black54,
          child: CustomSingleChildLayout(
              delegate: _ContextMenuLayoutDelegate(
                position: widgetPosition,
              ),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.green.withOpacity(0.5),
                  child: OverflowBox(
                    child: Row(
                      children: children,
                    ),
                  )
              )),
        ),
      );
    },
  );
}

class _ContextMenuLayoutDelegate extends SingleChildLayoutDelegate {
  _ContextMenuLayoutDelegate({this.position});

  final Rect position;

  /// 获取child的size constraint， 参数是传入的父视图constraint
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(Size(position.width, position.height));
  }

  /// 定位child
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(position.left, position.top);
  }

  /// 是否需要重新布局
  @override
  bool shouldRelayout(_ContextMenuLayoutDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}