import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_im/chat/chat_tools.dart';
import 'package:flutter_im/common/touch_callback.dart';

class ChatPageBottomEmoji extends StatelessWidget {

  OnEmojiChangedListener _listener;

  ChatPageBottomEmoji(this._listener);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ChatTools.loadEmoji(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = json.decode(snapshot.data.toString());
            return Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 5,
                    top: 5,
                    right: 5,
                  ),
                  color: Colors.white,
                  child: GridView.custom(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 6.0,
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return TouchCallBack(
                          child: Center(
                            child: Text(
                              String.fromCharCode(data[index]["unicode"]),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          callBack: () {
                            if (_listener != null) {
                              _listener(String.fromCharCode(data[index]["unicode"]));
                            }
                          },
                        );
                      },
                      childCount: data.length,
                    ),
                  ),
                ),
              ],
            );
          }
          return Container(
            height: 240,
            color: Colors.white,
          );
        });
  }
}

typedef OnEmojiChangedListener = Function(String emoji);