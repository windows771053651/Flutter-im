import 'package:flutter/services.dart';

class AndroidNativeChannel {

  static const String CHANNEL = "android/native/channel";

  static const platform = MethodChannel(CHANNEL);

  // 返回到桌面
  static const String BACK_TO_DESKTOP = "backDesktop";

  // 打开GPS
  static const String OPEN_GPS = "openGPS";

  static const String INSPECTION_GPS = "inspectionGPS";

  static Future<dynamic> dispatchChannelEvent(String methodName) async {
    dynamic future;
    try {
      future = platform.invokeMethod(methodName);
    } on PlatformException catch (e) {
      print(e.toString());
      future = false;
    }
    return future;
  }

  static Future<dynamic> inspectionGPS() async {
    return await AndroidNativeChannel.dispatchChannelEvent(AndroidNativeChannel.INSPECTION_GPS);
  }

  static Future<dynamic> openGPS() async {
    return await AndroidNativeChannel.dispatchChannelEvent(AndroidNativeChannel.OPEN_GPS);
  }
}

class GPSState {
  static const int GPS_OPEN = 1;

  static const int GPS_CLOSE = 0;
}