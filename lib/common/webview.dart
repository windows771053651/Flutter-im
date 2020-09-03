import 'package:flutter/cupertino.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  final url;

  final title;

  WebView({
    Key key,
    @required this.url,
    @required this.title,
  }): super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.shouldStart:
        //准备加载
          break;
        case WebViewState.startLoad:
        //开始加载
          break;
        case WebViewState.finishLoad:
        //加载完成
          break;
        case WebViewState.abortLoad:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: getAppBar(
        context,
        leftTitle: widget.title,
      ),
      url: widget.url,
      withZoom: true, //允许网页缩放
      withLocalStorage: true,
      withJavascript: true, //允许执行 js 代码
    );
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}