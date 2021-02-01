package com.hopeman.flutter_im;

import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class FlutterNativeChannel {

    public static final String CHANNEL = "android/native/channel";

    // 返回到桌面
    public static final String BACK_TO_DESKTOP = "backDesktop";

    // 打开GPS
    public static final String OPEN_GPS = "openGPS";

    public static final String INSPECTION_GPS = "inspectionGPS";

    public static void registerFlutterChannel(FlutterActivity activity, FlutterNativeChannelController controller) {
        new MethodChannel(activity.getFlutterView(), CHANNEL).setMethodCallHandler((MethodCall methodCall, MethodChannel.Result result) -> {
                    String method = methodCall.method;
                    if (BACK_TO_DESKTOP.equals(method)) {
                        result.success(true);
                        activity.moveTaskToBack(false);
                    } else if (INSPECTION_GPS.equals(method)) {
                        //检测GPS是否开启
                        boolean isOpen = GPSManagerImpl.isOPen(activity);
                        result.success(isOpen ? GPSManagerImpl.GPSState.GPS_OPEN : GPSManagerImpl.GPSState.GPS_CLOSE);
                    } else if (OPEN_GPS.equals(method)) {
                        Log.e("song", "open");
                        if (controller != null) {
                            controller.onController(result);
                        }
                        GPSManagerImpl.openGPSSettings(activity);
                    }
                }
        );
    }

    public interface FlutterNativeChannelController {
        void onController(MethodChannel.Result result);
    }
}