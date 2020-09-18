import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewLoadingPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<WebViewLoadingPage> {

  String url;

  String title;

  FlutterWebviewPlugin _webViewPlugin;

  double lineProgress = 0.0;

  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    _webViewPlugin = FlutterWebviewPlugin();
    _webViewPlugin.onProgressChanged.listen((progress) {
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }

  @override
  void dispose() {
    _webViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      isFirst = false;
      List<String> arguments = ModalRoute.of(context).settings.arguments;
      assert(arguments != null && arguments.length == 2, "web页面参数错误");
      title = arguments[0];
      url = arguments[1];
    }
    return WebviewScaffold(
      appBar: getAppBar(
        context,
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: Size.fromHeight(3),
        ),
        leftTitle: title,
      ),
      url: url,
      mediaPlaybackRequiresUserGesture: false,
      withZoom: false,
      withLocalStorage: true,
      hidden: false,
      withJavascript: true,
    );
  }

  _progressBar(double progress, BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
        backgroundColor: Colors.transparent,
        value: progress == 1.0 ? 0 : progress,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      ),
      height: 3,
    );
  }
}