import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/find/bean/live_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';

class LiveItem extends StatelessWidget {

  final LiveBean liveBean;

  final double itemWidth;

  LiveItem({
    this.liveBean,
    this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      radius: 10,
      child: Stack(
        children: [
          _getAvatar(FileUtil.getImagePath(liveBean.thumb)),
          Positioned(
            left: 4,
            bottom: 2,
            child: Text(
              liveBean.userName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            right: 4,
            bottom: 2,
            child: Text(
              liveBean.popularity,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
      callBack: () {
        Navigator.of(context).pushNamed(
          PageId.GROUP_PERSONAL_AUDIO_PLAYING_PAGE,
          arguments: [liveBean.userName, liveBean.videoUrl],
        );
      },
    );
  }

  Widget _getAvatar(String imageName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        imageName,
        fit: BoxFit.cover,
        width: itemWidth,
        height: itemWidth,
      ),
    );
  }

}