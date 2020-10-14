import 'package:flutter/material.dart';
import 'package:flutter_im/utils/device_util.dart';

import 'router/router_manager.dart';
import 'splash_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceUtil.setBarStatus(true);
    return MaterialApp(
      title: "聊天室",
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Color(0xFFebebeb),
        cardColor: Colors.green,
      ),
      routes: RouterManager.routers,
      home: SplashPage(),
    );
  }
}