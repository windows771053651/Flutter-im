import 'package:flutter/material.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/im_tools.dart';

class DialogUtil {
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
                ),
                _contentWidget(content),
                HorizontalLine(
                  height: 0.5,
                ),
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
                            }
                            Navigator.of(context).pop();
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
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
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

  static _contentWidget(String content) {
    return IMUtils.isStringEmpty(content)
        ? Container(height: 24,)
        : Container(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            margin: EdgeInsets.only(top: 12, bottom: 16),
          );
  }
}