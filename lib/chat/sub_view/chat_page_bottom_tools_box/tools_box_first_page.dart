import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/chat_message_bean.dart';
import 'package:flutter_im/chat/bean/tools_box_item_bean.dart';
import 'package:flutter_im/chat/sub_view/chat_page_bottom_tools_box/tools_box_item_factory.dart';
import 'package:flutter_im/chat_biz/message_manager.dart';
import 'package:flutter_im/chat_biz/message_manager_impl.dart';
import 'package:image_picker/image_picker.dart';

class ToolBoxFirstPage extends StatelessWidget {

  ToolsBoxItemFactoryImpl toolsBoxItemFactoryImpl;

  ToolBoxFirstPage() {
    toolsBoxItemFactoryImpl = ToolsBoxItemFactory();
  }

  @override
  Widget build(BuildContext context) {

    double cellSize = MediaQuery.of(context).size.width / 7.6;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo, "相册", cellSize, () {
              _openGallery(context);
            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo_camera, "拍摄", cellSize, () {
              _takePhoto(context);
            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.video_call, "视频通话", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.photo, "位置", cellSize, () {

            })),
          ],
        ),
        Container(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.attach_money, "红包", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.transform, "转账", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.settings_voice, "语音输入", cellSize, () {

            })),
            toolsBoxItemFactoryImpl.product(ToolsBoxItemBean(Icons.collections, "我的收藏", cellSize, () {

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
      name: "一休",
      chatMessageType: ChatMessageType.PICTURE,
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599128582535&di=9807439e68f649516e0c981f0f6ae910&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120627%2FImg346630529.jpg",
      inOutType: InOutType.OUT,
      nativePicturePath: path,
    ));
  }
}