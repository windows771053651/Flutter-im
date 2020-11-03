import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/bubble/bulle_widget.dart';
import 'package:flutter_im/common/bubble/popup_window.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';

class CommentBubbleWidget extends StatelessWidget {

  static final FABULOUS = 0X001;

  static final COMMENT = 0X002;

  final GlobalKey _globalKey = GlobalKey();

  /// 气泡高度
  final double _bubbleHeight = 32.0;

  /// 气泡item的宽度
  final double _bubbleItemWidth = 80.0;

  final List<String> _titles = ['赞', '评论'];

  final Function(int type) onItemSelected;

  CommentBubbleWidget(this.onItemSelected);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      key: _globalKey,
      child: Image.asset(FileUtil.getImagePath("menu_ellipsie2_icon"), width: 24, height: 16,),
      normalColor: Color(0x10000000),
      radius: 2,
      callBack: () {
        _showBubble(context);
      },
    );
  }

  void _showBubble(BuildContext context) {
    double _bubbleWidth = _bubbleItemWidth * _titles.length;
    /// 获取widget的宽高
    Rect rect = IMUtils.getWidgetPosition(context);
    /// 获取widge的位置，x，y信息
    Offset offset = IMUtils.getWidgetPosition2(_globalKey);
    /// 计算气泡Y方向偏移量
    double offsetY = _bubbleHeight / 2 - rect.height / 2;
    /// 计算气泡X方向偏移量
    double offsetX = _bubbleWidth - 4;
    Navigator.push(
      context,
      PopRoute(
        child: PopupWindow(
          child: BubbleWidget(
            _bubbleWidth,
            _bubbleHeight,
            Color(0xff333333),
            BubbleArrowDirection.bottom,
            length: 250,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: _titles.asMap().keys.map((i) {
                return Container(
                  child: Row(
                    children: <Widget>[
                      TouchCallBack(
                        pressedColor: Colors.transparent,
                        normalColor: Colors.transparent,
                        callBack: () {
                          if (onItemSelected != null) {
                            onItemSelected(i);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              _titles[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          width: _bubbleItemWidth,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            arrHeight: 0,
            innerPadding: 0.0,
          ),
          padding: EdgeInsets.fromLTRB(offset.dx - offsetX, offset.dy - offsetY, 0, 10),
        ),
      ),
    );
  }
}