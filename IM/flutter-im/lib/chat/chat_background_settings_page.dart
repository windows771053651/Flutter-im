import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:image_picker/image_picker.dart';

class ChatBackgroundSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: title,
      ),
      body: Column(
        children: <Widget>[
          CommonTextItemView(
            leftTitle: "从相册中选择",
            leftTitleWidth: 200,
            callback: () {
              _openGallery(context);
            },
          ),
          HorizontalLine(),
          CommonTextItemView(
            leftTitle: "拍一张",
            leftTitleWidth: 200,
            margin: EdgeInsets.only(top: 0.5),
            callback: () {
              _takePhoto(context);
            },
          ),
        ],
      ),
    );
  }

  /*拍照*/
  _takePhoto(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null && image.existsSync()) {
      Navigator.of(context).pop(image);
    }
  }

  /*相册*/
  _openGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null && image.existsSync()) {
      Navigator.of(context).pop(image);
    }
  }
}