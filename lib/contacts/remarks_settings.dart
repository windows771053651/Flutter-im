import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/utils/show_toast.dart';

class RemarksSettings extends StatefulWidget {
  @override
  State createState() => SettingsState();
}

class SettingsState extends State<RemarksSettings> {

  TextEditingController _textEditingController;

  bool _isEmpty = true;

  bool isFirst = true;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _name = ModalRoute.of(context).settings.arguments;
    if (isFirst) {
      isFirst = false;
      _textEditingController = TextEditingController.fromValue(TextEditingValue(
        text: _name,
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
        leftTitle: "设置备注和标签",
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
                  showToast("请填写备注名");
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
              "备注名",
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
                      hintText: "新的备注名称",
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