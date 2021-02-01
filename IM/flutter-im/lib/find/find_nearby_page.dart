import 'package:flutter/cupertino.dart';
import 'package:flutter_im/utils/android_native_channel.dart';
import 'package:flutter_im/utils/show_toast.dart';

class FindNearbyPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<FindNearbyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Future<dynamic> result = AndroidNativeChannel.inspectionGPS();
    if (result != null) {
      result.then((value) {
        if (GPSState.GPS_CLOSE == value) {
          Future<dynamic> result = AndroidNativeChannel.openGPS();
          if (result != null) {
            result.then((value) {
              Future<dynamic> result = AndroidNativeChannel.inspectionGPS();
              if (result != null) {
                result.then((value) {
                  if (GPSState.GPS_OPEN == value) {
                    showToast("GPS已打开");
                  } else {
                    showToast("GPS已关闭");
                  }
                });
              }
            });
          }
        } else {
          showToast("GPS已打开");
        }
      });
    }
    return Center(
      child: Text("附近的人"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
