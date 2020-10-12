
import 'package:flutter/material.dart';

class ChatTools {
  static Future<String> _emojiFuture;

  /// 加载emoji表情信息
  static Future<String> loadEmoji(BuildContext context) {
    if (_emojiFuture == null) {
      _emojiFuture = DefaultAssetBundle.of(context).loadString("assets/emoji_list.json");
    }
    return _emojiFuture;
  }
}
