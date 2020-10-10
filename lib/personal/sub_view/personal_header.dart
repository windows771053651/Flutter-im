import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

import '../personal_constant.dart';

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
          getClipRRectImage(networkUrl: PersonalConstant.userAvatar),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    PersonalConstant.userName,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff353535),
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
                      color: Color(0xffa9a9a9),
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
            child: Image.asset("images/code.png", width: 16, height: 16,),
          ),
          Image.asset("images/icon_arrow_right.png", width: 16, height: 16,),
        ],
      ),
    );
  }
}