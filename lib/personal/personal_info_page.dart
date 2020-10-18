import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/contacts/bean/remark_settings_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:image_picker/image_picker.dart';

/// 个人信息页面
class PersonalInfoPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<PersonalInfoPage> {

  String _backgroundImageNativePath;

  /// 是否是本地图片
  bool _isAvatarNativeResource = false;

  String name = Constants.userName;

  String code = Constants.userCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "个人信息",
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _getAvatarItem(),
            HorizontalLine(),
            CommonTextItemView(
              leftTitle: "昵称",
              rightText: name,
              callback: () {
                Future future = Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_REMARKS_SETTINGS, arguments: RemarksSettingsBean("设置昵称", "新的昵称", "请填写昵称", name, "新昵称"));
                future.then((value) {
                  if (value != null) {
                    setState(() {
                      name = value;
                    });
                  }
                });
              },
            ),
            HorizontalLine(),
            CommonTextItemView(
              leftTitle: "微信号",
              rightText:
              code,
              callback: () {
                Future future = Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_REMARKS_SETTINGS, arguments: RemarksSettingsBean("设置微信号", "新的微信号", "请填写微信号", code, "新的微信号"));
                future.then((value) {
                  if (value != null) {
                    setState(() {
                      code = value;
                    });
                  }
                });
              },
            ),
            HorizontalLine(height: 8,),
            CommonTextItemView(
              leftTitle: "二维码名片",
              leftTitleWidth: 100,
              callback: () {
                Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_QR_CODE_BUSINESS_CARD);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 头像
  Widget _getAvatarItem() {
    return TouchCallBack(
      padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              "头像",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff353535)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            child: _getAvatarImageWidget(),
          ),
          Image.asset(
            FileUtil.getImagePath("icon_arrow_right"),
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          )
        ],
      ),
      callBack: () {
        _openGallery(context);
      },
    );
  }

  /*相册*/
  _openGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null && image.existsSync()) {
      _backgroundImageNativePath = image.path;
      setState(() {
        _isAvatarNativeResource = true;
      });
    }
  }

  Widget _getAvatarImageWidget() {
    return _isAvatarNativeResource
        ? IMUtils.getClipRRectImage(nativePath: _backgroundImageNativePath)
        : IMUtils.getClipRRectImage(assetPath: FileUtil.getImagePath("yixiu", format: "jpg"));
  }
}