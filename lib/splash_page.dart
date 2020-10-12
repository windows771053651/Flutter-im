import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/timer_util.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() => LoadingState();
}

class LoadingState extends State<SplashPage> {

  TimerUtil _timerUtil;

  int _count = 3;

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  @override
  void dispose() {
    if (null != _timerUtil) {
      _timerUtil.cancel();
    }
    super.dispose();
  }

  _initSplash() {
    _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        _goNext();
      }
    });
    _timerUtil.startCountDown();
  }

  _goNext() {
    Navigator.of(context).pushReplacementNamed(PageId.GROUP_MAIN);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Image.asset(
            FileUtil.getImagePath("splash_icon", format: "jpg"),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: TouchCallBack(
                normalColor: Colors.transparent,
                pressedColor: Colors.transparent,
                child: Text(
                  "跳过$_count",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                callBack: () {
                  _goNext();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}