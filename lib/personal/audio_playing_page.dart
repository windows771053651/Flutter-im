import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:video_player/video_player.dart';

/// 视频播放
class AudioPlayingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPlayerState();
  }
}

class VideoPlayerState extends State<AudioPlayingPage> {
  VideoPlayerController _controller;
  VoidCallback _listener;
  String _url;

  String _title;

  bool _isFirst = true;

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_listener);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      List<String> arguments = ModalRoute.of(context).settings.arguments;
      assert(arguments != null && arguments.length == 2, "视频播放页面参数错误");
      _title = arguments[0];
      _url = arguments[1];
      if (IMUtils.isStringNotEmpty(_url)) {
        if (_url.startsWith('http')) {
          _controller = VideoPlayerController.network(_url)
            ..initialize().then((_) {
              setState(() {
                _controller.addListener(_listener);
                _controller.play();
              });
            });
        } else if (_url.contains('assets/video/')) {
          _controller = VideoPlayerController.asset(_url)
            ..initialize().then((_) {
              setState(() {
                _controller.addListener(_listener);
                _controller.play();
              });
            });
        }
      }
    }

    double ratio;
    if (_controller.value.initialized) {
      double audioWidth = _controller.value.size.width;
      double audioHeight = _controller.value.size.height;
      ratio = audioWidth / audioHeight;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: _controller.value.initialized
          ? Center(
              child: Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .width / ratio,
                child: VideoPlayer(_controller),
              ),
            )
          : Container(),
    );
  }
}
