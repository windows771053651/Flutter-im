import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_im/chat/chat_tools.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/file_util.dart';

class ChatPageBottomEmoji extends StatelessWidget {

  final OnEmojiAddedListener onEmojiAdded;

  final OnEmojiDeleteListener onEmojiDelete;

  ChatPageBottomEmoji({
    this.onEmojiAdded,
    this.onEmojiDelete,
  });

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
                            if (onEmojiAdded != null) {
                              onEmojiAdded(String.fromCharCode(data[index]["unicode"]));
                            }
                          },
                        );
                      },
                      childCount: data.length,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: TouchCallBack(
                    pressedColor: Colors.white,
                    padding: EdgeInsets.only(left: 34, top: 12),
                    child: IconButton(
                      icon: Image.asset(FileUtil.getImagePath("face_delete"), width: 60, height: 60),
                    ),
                    callBack: () {
                      if (onEmojiDelete != null) {
                        onEmojiDelete();
                      }
                    },
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

typedef OnEmojiAddedListener = Function(String emoji);

typedef OnEmojiDeleteListener = Function();