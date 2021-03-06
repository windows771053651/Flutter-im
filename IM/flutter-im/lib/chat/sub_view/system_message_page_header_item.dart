import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/utils/im_tools.dart';

class SystemMessageHeaderItem extends StatelessWidget {

  final String iconUrl;

  final String name;

  final double marginLeft;

  final double marginRight;

  final ScrollController scrollController;

  SystemMessageHeaderItem({
    this.iconUrl,
    this.name,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scrollOffset = 0;
    scrollController.addListener(() {
      scrollOffset = scrollController.offset;
    });
    return TouchCallBack(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      normalColor: Colors.transparent,
      pressedColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IMUtils.getClipRRectImage(
              networkUrl: iconUrl,
              width: 44,
              height: 44,
              radius: 44 / 2,
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 10,
                color: IMColors.c_FF707070,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      callBack: () {
          Rect rect = IMUtils.getWidgetPosition(context);
          if (rect.left + rect.width / 2 != screenWidth / 2) {
            double offset = (rect.left + rect.width / 2 - screenWidth / 2);
            _scrollToCenterHorizontal(offset + scrollOffset);
          }
      },
    );
  }

  _scrollToCenterHorizontal(double offset) {
    scrollController.animateTo(
      offset,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
