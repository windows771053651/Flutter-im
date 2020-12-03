import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/database/message_manager_impl.dart';
import 'package:flutter_im/utils/file_util.dart';

class ChatPageGifWidget extends StatefulWidget {

  final String targetName;

  final String targetAvatarUrl;

  ChatPageGifWidget(this.targetName, this.targetAvatarUrl);

  @override
  State createState() => _State();
}

class _State extends State<ChatPageGifWidget> with AutomaticKeepAliveClientMixin {

  List<String> _gifList = new List();

  @override
  Widget build(BuildContext context) {
    _initFaceList();
    return Container(
      padding: EdgeInsets.only(
        left: 5,
        top: 5,
        right: 5,
      ),
      color: Colors.white,
      child: GridView.custom(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 4,
          crossAxisSpacing: 6.0,
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return TouchCallBack(
            radius: 4,
            padding: EdgeInsets.all(4),
            callBack: () {
              MessageControllerImpl.instance.sendMessage(ChatMessageBean.build(
                targetName: widget.targetName,
                targetAvatarUrl: widget.targetAvatarUrl,
                currentName: Constants.userName,
                currentAvatarUrl: Constants.userAvatar,
                chatMessageType: ChatMessageType.PICTURE,
                inOutType: InOutType.OUT,
                nativePicturePath: _gifList[index],
              ));
            },
            child: Image.asset(_gifList[index]),);
        },
          childCount: _gifList.length,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _initFaceList() {
    if (_gifList.length > 0) {
      _gifList.clear();
    }
    // 添加斗图
    for (int i = 0; i < 96; i++) {
      if (i == 70 || i == 74) {
        String facePath =
        FileUtil.getAssetsPath("gif", i.toString(), format: 'png');
        _gifList.add(facePath);
      } else {
        String facePath =
        FileUtil.getAssetsPath("gif", i.toString(), format: 'gif');
        _gifList.add(facePath);
      }
    }
  }
}