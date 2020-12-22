
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_im/utils/im_tools.dart';

class ChatTools {
  static Future<String> _emojiFuture;

  static List<String> emoji;

  /// 加载emoji配置文件
  static Future<String> loadEmojiConfig(BuildContext context) {
    if (_emojiFuture == null) {
      _emojiFuture = DefaultAssetBundle.of(context).loadString("assets/emoji_list.json");
    }
    return _emojiFuture;
  }
  /// 加载emoji表情
  static List<String> loadEmoji(String emojiSource) {
    if (emoji == null) {
      emoji = List();
      List<dynamic> data = json.decode(emojiSource);
      if (IMUtils.isListNotEmpty(data)) {
        for (int i = 0; i < data.length; i++) {
          emoji.add(String.fromCharCode(data[i]["unicode"]));
        }
      }
    }
    return emoji;
  }
}
