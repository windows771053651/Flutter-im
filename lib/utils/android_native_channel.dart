import 'package:flutter/services.dart';

class AndroidNativeChannel {

  static const String CHANNEL = "android/native/channel";

  static const platform = MethodChannel(CHANNEL);

  static const String BACK_TO_DESKTOP = "backDesktop";

  static Future<dynamic> dispatchChannelEvent(String methodName) async {
    dynamic future;
    try {
      switch(methodName) {
        case BACK_TO_DESKTOP:
          future = platform.invokeMethod(methodName);
          break;
      }
    } on PlatformException catch (e) {
      print(e.toString());
      future = false;
    }
    return future;
  }
}

