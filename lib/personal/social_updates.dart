import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';

class SocialUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "好友动态",
      ),
    );
  }
}