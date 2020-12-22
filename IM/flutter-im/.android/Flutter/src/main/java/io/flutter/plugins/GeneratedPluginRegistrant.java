package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
      com.liuwei.easy_contact_picker.EasyContactPickerPlugin.registerWith(shimPluginRegistry.registrarFor("com.liuwei.easy_contact_picker.EasyContactPickerPlugin"));
      com.flutter_webview_plugin.FlutterWebviewPlugin.registerWith(shimPluginRegistry.registrarFor("com.flutter_webview_plugin.FlutterWebviewPlugin"));
      io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin.registerWith(shimPluginRegistry.registrarFor("io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin"));
      com.example.imagegallerysaver.ImageGallerySaverPlugin.registerWith(shimPluginRegistry.registrarFor("com.example.imagegallerysaver.ImageGallerySaverPlugin"));
      io.flutter.plugins.imagepicker.ImagePickerPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.imagepicker.ImagePickerPlugin"));
      com.github.adee42.keyboardvisibility.KeyboardVisibilityPlugin.registerWith(shimPluginRegistry.registrarFor("com.github.adee42.keyboardvisibility.KeyboardVisibilityPlugin"));
      io.flutter.plugins.pathprovider.PathProviderPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
      com.baseflow.permissionhandler.PermissionHandlerPlugin.registerWith(shimPluginRegistry.registrarFor("com.baseflow.permissionhandler.PermissionHandlerPlugin"));
      top.kikt.imagescanner.ImageScannerPlugin.registerWith(shimPluginRegistry.registrarFor("top.kikt.imagescanner.ImageScannerPlugin"));
      io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
      com.tekartik.sqflite.SqflitePlugin.registerWith(shimPluginRegistry.registrarFor("com.tekartik.sqflite.SqflitePlugin"));
      io.flutter.plugins.videoplayer.VideoPlayerPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.videoplayer.VideoPlayerPlugin"));
  }
}
