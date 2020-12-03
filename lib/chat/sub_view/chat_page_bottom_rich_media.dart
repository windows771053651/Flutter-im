import 'package:flutter/cupertino.dart';
import 'package:flutter_im/common/select_callback.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/utils/file_util.dart';

import 'chat_page_bottom_emoji.dart';
import 'chat_page_bottom_gif_widget.dart';

/// 聊天页面，底部富媒体控件，包括emoji和gif动图等
class ChatPageBottomRichMediaWidget extends StatefulWidget {

  List<Widget> pages;

  ChatPageBottomRichMediaWidget(String targetName, String targetAvatarUrl, {
    OnEmojiAddedListener onEmojiAdded,
    OnEmojiDeleteListener onEmojiDelete,
  }) {
    pages = [
      ChatPageBottomEmoji(onEmojiAdded: onEmojiAdded, onEmojiDelete: onEmojiDelete),
      ChatPageGifWidget(targetName, targetAvatarUrl),
    ];
  }

  @override
  State createState() => _State();

}

class _State extends State<ChatPageBottomRichMediaWidget> {

  int _currentIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: IMColors.c_FFebebeb,
      child: Column(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 8, right: 12),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildSelectCallback("chat_emoji_icon", 0),
                _buildSelectCallback("collection_icon", 1),
              ],
            ),
          ),
          Container(
            height: 200,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) => widget.pages[index],
              controller: _pageController,
              itemCount: widget.pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildSelectCallback(String iconAssetName, int index) {
    return SelectCallback(
      selected: _currentIndex == index,
      child: Container(
        child: Image.asset(
          FileUtil.getImagePath(iconAssetName),
          width: 24,
          height: 24,
          color: IMColors.c_ff2c2c2c,
        ),
      ),
      callBack: () {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 10), curve: Curves.ease);
        });
      },
    );
  }
}