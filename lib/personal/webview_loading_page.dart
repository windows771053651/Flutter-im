import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/webview.dart';

class WebViewLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> arguments = ModalRoute.of(context).settings.arguments;
    return WebView(
      title: arguments[0],
      url: arguments[1],
    );
  }
}