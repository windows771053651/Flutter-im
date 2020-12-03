import 'package:flutter/material.dart';
import 'package:flutter_im/chat/chat_tools.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/file_util.dart';

class ChatPageBottomEmoji extends StatefulWidget {

  final OnEmojiAddedListener onEmojiAdded;

  final OnEmojiDeleteListener onEmojiDelete;

  ChatPageBottomEmoji({
    this.onEmojiAdded,
    this.onEmojiDelete,
  });

  @override
  State createState() => _State();
}

class _State extends State<ChatPageBottomEmoji> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ChatTools.loadEmojiConfig(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> emoji = ChatTools.loadEmoji(snapshot.data.toString());
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
                    childrenDelegate: SliverChildBuilderDelegate((context, index) {
                        return TouchCallBack(
                          child: Center(
                            child: Text(
                              emoji[index],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          callBack: () {
                            if (widget.onEmojiAdded != null) {
                              widget.onEmojiAdded(emoji[index]);
                            }
                          },
                        );
                      },
                      childCount: emoji.length,
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
                      if (widget.onEmojiDelete != null) {
                        widget.onEmojiDelete();
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

  @override
  bool get wantKeepAlive => true;
}

typedef OnEmojiAddedListener = Function(String emoji);

typedef OnEmojiDeleteListener = Function();