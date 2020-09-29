import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/show_toast.dart';

import 'bean/remark_settings_bean.dart';

class RemarksSettings extends StatefulWidget {
  @override
  State createState() => _SettingsState();
}

class _SettingsState extends State<RemarksSettings> {

  TextEditingController _textEditingController;

  bool _isEmpty = true;

  bool _isFirst = true;

  RemarksSettingsBean remarksSettingsBean;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      remarksSettingsBean = ModalRoute.of(context).settings.arguments;
      _isFirst = false;
      _textEditingController = TextEditingController.fromValue(TextEditingValue(
        text: remarksSettingsBean.value,
      ));
      _textEditingController.addListener(() {
        setState(() {
          _isEmpty = _textEditingController.text.isEmpty;
        });
      });
      _isEmpty = _textEditingController.text.isEmpty;
    }

    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: remarksSettingsBean.title,
        actions: [
          Container(
            width: 80,
            child: FlatButton(
              child: Text(
                "保存",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                ),
              ),
              onPressed: () {
                if (_textEditingController.text.isEmpty) {
                  showToast(remarksSettingsBean.toastText);
                } else {
                  Navigator.of(context).pop(_textEditingController.text);
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 12, top: 8, bottom: 8),
            child: Text(
              remarksSettingsBean.tips,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color(0xFFededed),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xFFededed),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: remarksSettingsBean.hintText,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                    controller: _textEditingController,
                  ),
                ),
               Visibility(
                 visible: !_isEmpty,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: TouchCallBack(
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey,
                          size: 16,
                        ),
                        callBack: () {
                          _textEditingController.clear();
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}