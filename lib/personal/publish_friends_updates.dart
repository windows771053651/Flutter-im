import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

import 'bean/friends_updates_bean.dart';
import 'bean/image_display_bean.dart';
import 'image_display_page.dart';

class PublishFriendsUpdates extends StatelessWidget {

  List<String> _nativePictureAbsPath;

  List<String> _nativePictureDisplayAbsPath;

  String _name;

  String _avatarUrl;

  String _content = "";

  @override
  Widget build(BuildContext context) {
    List params = ModalRoute.of(context).settings.arguments;
    _name = params[0];
    _avatarUrl = params[1];
    _nativePictureAbsPath = params[2];
    if (IMUtils.isListNotEmpty(_nativePictureAbsPath)) {
      _nativePictureDisplayAbsPath = List();
      _nativePictureAbsPath.forEach((bean) {
        _nativePictureDisplayAbsPath.add(bean + ImageDisplayPage.nativePictureFlag);
      });
      return Scaffold(
        appBar: getAppBar(
          context,
          leftTitle: "好友动态",
          actions: [
            TouchCallBack(
              normalColor: Colors.transparent,
              pressedColor: IMColors.c_20000000,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: Text(
                  "发表",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              callBack: () {
                FriendsUpdatesBean bean = FriendsUpdatesBean(
                  userName: _name,
                  avatarUrl: _avatarUrl,
                  title: _content,
                  icons: _nativePictureDisplayAbsPath,
                  time: "刚刚"
                );
                Navigator.of(context).pop(bean);
              },
            ),
          ],
        ),
        body: _getBodyWidget(context),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  Widget _getBodyWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "这一刻的想法...",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              onChanged: (value) {
                _content = value;
              },
            ),
          ),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: List.generate(_nativePictureAbsPath.length, (index) {
                return TouchCallBack(
                  normalColor: Colors.transparent,
                  pressedColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(_nativePictureAbsPath[index])),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  callBack: () {
                    Navigator.of(context).pushNamed(
                        PageId.GROUP_PERSONAL_MULTI_IMAGE_DISPLAY,
                        arguments: ImageDisplayBean(
                            index: index,
                            pictures: _nativePictureDisplayAbsPath,
                        ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}