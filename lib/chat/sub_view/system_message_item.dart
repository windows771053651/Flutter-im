import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/system_message_bean.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';

class SystemMessageItem extends StatelessWidget {

  final SystemMessageBean systemMessageBean;

  SystemMessageItem({
    this.systemMessageBean,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TouchCallBack(
          pressedColor: Colors.transparent,
          normalColor: Colors.transparent,
          callBack: () {
            Navigator.of(context).pushNamed(PageId.GROUP_MAIN_WEBVIEW_LOADING_PAGE, arguments: [systemMessageBean.name, systemMessageBean.detailsUrl]);
          },
          child: Container(
            padding: EdgeInsets.only(top: 8,),
            margin: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: getClipRRectImage(networkUrl: systemMessageBean.authorAvatarUrl, width: 24, height: 24, radius: 24 / 2),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          systemMessageBean.name,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[700],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Text(
                        systemMessageBean.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 8,
                ),
                AspectRatio(
                  aspectRatio: 2.0,
                  child: Image.network(systemMessageBean.displayPictureUrl, fit: BoxFit.cover,),
                ),
                TouchCallBack(
                  bottomLeftRadius: 8,
                  bottomRightRadius: 8,
                  callBack: () {
                    Navigator.of(context).pushNamed(PageId.GROUP_MAIN_WEBVIEW_LOADING_PAGE, arguments: [systemMessageBean.name, systemMessageBean.detailsUrl]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 12, top: 12, right: 12),
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                systemMessageBean.title,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Visibility(
                                visible: systemMessageBean.subTitle.length != 0,
                                child: Text(
                                  systemMessageBean.subTitle,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: systemMessageBean.subIconUrl.length != 0,
                          child: Image.network(systemMessageBean.subIconUrl, width: 52, height: 52, fit: BoxFit.cover,),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 24,
        ),
      ],
    );
  }
}