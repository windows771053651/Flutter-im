import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/utils/im_tools.dart';

class PersonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
      child: Row(
        children: <Widget>[
          getClipRRectImage(assetPath: "images/yixiu.jpg"),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "一休",
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
          Image.asset("images/code.png", width: 16, height: 16,),
        ],
      ),
    );
  }
}