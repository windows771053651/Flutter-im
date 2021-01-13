import 'package:flutter/material.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/utils/device_util.dart';
import 'package:flutter_im/utils/sp_util.dart';

import 'router/router_manager.dart';
import 'splash_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeviceUtil.setBarStatus(true);
    SPUtil.init();
    return MaterialApp(
      title: "聊天室",
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: IMColors.c_FFebebeb,
        cardColor: Colors.green,
      ),
      routes: RouterManager.routers,
      home: SplashPage(),
    );
  }
}