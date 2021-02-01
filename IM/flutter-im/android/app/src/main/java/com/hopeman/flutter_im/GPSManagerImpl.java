package com.hopeman.flutter_im;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.location.LocationManager;
import android.provider.Settings;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;

public class GPSManagerImpl {

    public static boolean isOPen(FlutterActivity activity) {
        LocationManager locationManager = (LocationManager) activity.getSystemService(Context.LOCATION_SERVICE);
        boolean gps = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER);
        /**确认GPS是否开启**/
        return gps;
    }

    public static boolean checkGpsIsOpen(FlutterActivity context) {
        boolean isOpen;
        LocationManager locationManager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
        isOpen = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER);
        return isOpen;
    }

    public static void openGPSSettings(final FlutterActivity context) {
        if (checkGpsIsOpen(context)) {
            Toast.makeText(context, "true", Toast.LENGTH_SHORT).show();
        } else {
            new AlertDialog.Builder(context).setTitle("打开 GPS")
                    .setMessage("去打开")
                    .setNegativeButton("关闭", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {
                            // 关闭dialog
                            dialogInterface.dismiss();
                        }
                    })
                    .setPositiveButton("打开", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {
                            //跳转到手机原生设置页面
                            Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                            context.startActivityForResult(intent, MainActivity.OPEN_GPS_REQUEST_CODE);
                        }
                    })
                    .setCancelable(false)
                    .show();
        }
    }

    public interface GPSState {
        int GPS_OPEN = 1;

        int GPS_CLOSE = 0;
    }
}
