import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat/bean/tools_box_item_bean.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_tools_box/tools_box_item_factory.dart';
import 'package:flutter_im/chat_biz/message_manager_impl.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:image_picker/image_picker.dart';

class ToolBoxFirstPage extends StatelessWidget {

  ToolsBoxItemFactoryImpl _toolsBoxItemFactoryImpl;

  final String targetName;

  final String targetAvatarUrl;

  ToolBoxFirstPage(this.targetName, this.targetAvatarUrl,) {
    _toolsBoxItemFactoryImpl = ToolsBoxItemFactory();
  }

  @override
  Widget build(BuildContext context) {

    double _cellSize = MediaQuery.of(context).size.width / 7.6;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo, "相册", _cellSize, () {
              _openGallery(context);
            })),
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo_camera, "拍摄", _cellSize, () {
              _takePhoto(context);
            })),
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.video_call, "视频通话", _cellSize, () {

            })),
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo, "位置", _cellSize, () {

            })),
          ],
        ),
        Container(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.attach_money, "红包", _cellSize, () {

            })),
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.transform, "转账", _cellSize, () {

            })),
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.settings_voice, "语音输入", _cellSize, () {

            })),
            _toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.collections, "我的收藏", _cellSize, () {

            })),
          ],
        ),
      ],
    );
  }

  /*拍照*/
  _takePhoto(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null && image.existsSync()) {
      _sendPictureMessage(image.path);
    }
  }

  /*相册*/
  _openGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null && image.existsSync()) {
      _sendPictureMessage(image.path);
    }
  }

  /// 发送图片消息
  _sendPictureMessage(String path) {
    MessageControllerImpl.instance.sendMessage(ChatMessageBean.build(
      targetName: targetName,
      targetAvatarUrl: targetAvatarUrl,
      currentName: Constants.userName,
      currentAvatarUrl: Constants.userAvatar,
      chatMessageType: ChatMessageType.PICTURE,
      inOutType: InOutType.OUT,
      nativePicturePath: path,
    ));
  }
}