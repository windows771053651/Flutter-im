import 'package:flutter/material.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/touch_callback.dart';

class DialogUtil {
  /// todo content未定义
  static void showBaseDialog(BuildContext context,
      String content, {
        String title = '提示',
        String left = '取消',
        String right = '确认',
        VoidCallback leftClick,
        VoidCallback rightClick,}) {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 24),
                ),
                HorizontalLine(
                  height: 0.5,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                            ),
                            child: TouchCallBack(
                              bottomLeftRadius: 2,
                              child: Center(
                                child: Text(
                                  left,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              callBack: () {
                                if (leftClick != null) {
                                  leftClick();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 0.5,
                          height: 42,
                          color: Color(0xffededed),
                        ),
                        Expanded(
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                            ),
                            child: TouchCallBack(
                              bottomRightRadius: 2,
                              child: Center(
                                child: Text(
                                  right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[700],
                                  ),
                                ),
                              ),
                              callBack: () {
                                if (rightClick != null) {
                                  rightClick();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}