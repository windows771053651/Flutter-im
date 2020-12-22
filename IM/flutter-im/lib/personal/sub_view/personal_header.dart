import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';

class PersonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      padding: EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
      callBack: () {
        Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_PERSONAL_INFO);
      },
      child: Row(
        children: <Widget>[
          IMUtils.getClipRRectImage(networkUrl: Constants.userAvatar),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Constants.userName,
                    style: TextStyle(
                      fontSize: 18,
                      color: IMColors.c_ff353535,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  Container(
                    height: 4,
                  ),
                  Text(
                    "账号：yixiu1976",
                    style: TextStyle(
                      fontSize: 12,
                      color: IMColors.c_ffa9a9a9,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Image.asset(FileUtil.getImagePath("code"), width: 16, height: 16,),
          ),
          Image.asset(FileUtil.getImagePath("icon_arrow_right"), width: 16, height: 16,),
        ],
      ),
    );
  }
}