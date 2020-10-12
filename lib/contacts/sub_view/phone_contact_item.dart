import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/file_util.dart';

class PhoneContactItem extends StatelessWidget {

  final Contact contact;

  final VoidCallback callback;

  PhoneContactItem({
    Key key,
    @required this.contact,
    this.callback,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contact.fullName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff353535),
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      "账号：古力娜扎",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Text(
                "已添加",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(FileUtil.getImagePath("nazha", format: "jpg"), width: 34, height: 34, fit: BoxFit.cover,),
    );
  }
}