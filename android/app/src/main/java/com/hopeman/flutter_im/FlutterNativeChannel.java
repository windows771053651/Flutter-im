package com.hopeman.flutter_im;

import android.os.Bundle;

import android.view.KeyEvent;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class FlutterNativeChannel {

    public static final String CHANNEL = "android/native/channel";

    public static final String BACK_TO_DESKTOP = "backDesktop";

    public static void registerFlutterChannel(FlutterActivity activity) {
        new MethodChannel(activity.getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if (BACK_TO_DESKTOP.equals(methodCall.method)) {
                            result.success(true);
                            activity.moveTaskToBack(false);
                        }
                    }
                }
        );
    }
}