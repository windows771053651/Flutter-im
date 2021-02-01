package com.hopeman.flutter_im;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    public static final int OPEN_GPS_REQUEST_CODE = 1;

    private MethodChannel.Result result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        FlutterNativeChannel.registerFlutterChannel(this, (MethodChannel.Result result) -> this.result = result);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch (requestCode) {
            case OPEN_GPS_REQUEST_CODE:
                result.success(GPSManagerImpl.GPSState.GPS_OPEN);
                break;
        }
    }
}