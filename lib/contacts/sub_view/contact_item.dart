import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/im_tools.dart';

import '../bean/contact_bean.dart';

class ContactItem extends StatelessWidget {

  final ContactVO contactVO;

  final String titleName;

  final String imageName;

  final double size;

  final int index;

  final VoidCallback callback;

  final ContactController controller;

  final bool headerSutTitleVisible;

  ContactItem({
    this.index,
    this.contactVO,
    this.titleName,
    this.imageName,
    this.size = 34,
    this.callback,
    this.controller,
    this.headerSutTitleVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _getSubTitleWidget(),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xffededed),
              ),
            ),
          ),
          constraints: BoxConstraints(
            minHeight: 60,
          ),
          child: TouchCallBack(
            callBack: callback,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: _getAvatar(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Text(
                    titleName == null ? contactVO.name : titleName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff353535),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSubTitleWidget() {
    if (headerSutTitleVisible) {
      assert(controller != null);
      bool subTitleVisible = false;
      if (index == 0) {
        subTitleVisible = true;
      } else {
        ContactVO last = controller(index - 1);
        subTitleVisible = !compareString(last.initials, contactVO.initials);
      }
      if (subTitleVisible) {
        return Container(
          height: 30,
          color: Color(0xffededed),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 12),
          child: Text(
            contactVO.initials,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  Widget _getAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: imageName == null
          ? Image.network(
              contactVO.avatarUrl,
              width: size,
              height: size,
              fit: BoxFit.cover,
            )
          : Image.asset(
              imageName,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
    );
  }
}

typedef ContactController = ContactVO Function(int index);
