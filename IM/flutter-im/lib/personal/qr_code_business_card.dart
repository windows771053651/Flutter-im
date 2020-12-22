
import 'dart:typed_data';
import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/bottom_sheet_dialog.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:flutter_im/utils/show_toast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 二维码名片页面
class QRCodeBusinessCard extends StatelessWidget {

  GlobalKey _repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "二维码名片",
        actions: [
          TouchCallBack(
            normalColor: Colors.transparent,
            pressedColor: Colors.green[700],
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Image.asset(
              FileUtil.getImagePath("menu_ellipsie_icon"),
              width: 32,
            ),
            callBack: () {
              _displayDialog(context);
            },
          ),
        ],
      ),
      body: _getBodyWidget(context),
    );
  }

  Widget _getBodyWidget(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        key: _repaintKey,
        child: Container(
          height: 420,
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: <Widget>[
              _getUserInfoWidget(),
              _getQRCardWidget(context),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  "扫一扫上面的二维码图案，加我好友",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getQRCardWidget(BuildContext context) {
    double _cardSize = MediaQuery.of(context).size.width - 24 * 2 - 16 * 2;
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: QrImage (
        backgroundColor: IMColors.c_ffffffff,
        padding: EdgeInsets.all(0),
        data: Constants.userName,
        size: _cardSize,
      ),
    );
  }

  Widget _getUserInfoWidget() {
    return Row(
      children: <Widget>[
        IMUtils.getClipRRectImage(assetPath: FileUtil.getImagePath("yixiu", format: "jpg"),),
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Constants.userName,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "中国大陆 上海",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 显示保存二维码对话框
  void _displayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var list = List();
        list.add('保存到手机');
        return BottomSheetWidget(
          list: list,
          onItemClickListener: (index) async {
            Navigator.pop(context);
            Future future = _capturePng();
            future.then((onValue) {
              if (onValue != null) {
                _saveCardToGallery(onValue);
              }
            });
          },
        );
      },
    );
  }

  /// 保存二维码到相册
  void _saveCardToGallery(Uint8List uint8list) async {
    /// 获取权限
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.photos);
    if (permission == PermissionStatus.granted) {
      PermissionHandler().requestPermissions(<PermissionGroup>[PermissionGroup.storage]);
      final result = await ImageGallerySaver.saveImage(uint8list.buffer.asUint8List());
      if (IMUtils.isStringNotEmpty(result)) {
        showToast("保存成功");
      } else {
        showToast("保存失败");
      }
    } else {
      bool isOpened = await PermissionHandler().openAppSettings();
      print(isOpened);
    }
  }

  /// 生成二维码截图
  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = _repaintKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: prefix0.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
