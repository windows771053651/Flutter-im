import 'package:flutter/material.dart';

import 'router/router_manager.dart';
import 'splash_page.dart';

void main() => runApp(MaterialApp(
  title: "聊天室",
  theme: ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green,
  ),
  routes: RouterManager.routers,
  home: SplashPage(),
));

