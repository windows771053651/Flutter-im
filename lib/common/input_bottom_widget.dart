import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputButtomWidget extends StatelessWidget {

  final ValueChanged onEditingCompleteText;
  final TextEditingController controller = TextEditingController();

  InputButtomWidget({this.onEditingCompleteText});

  @override

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Column(
        children: <Widget>[
          Expanded(
              child: new GestureDetector(
                child: new Container(
                  color: Colors.transparent,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
          ),
          new Container(
              color: Color(0xFFF4F4F4),
              padding: EdgeInsets.only(left: 16,top: 8,bottom: 8,right: 16),
              child:  Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  //设置键盘按钮为发送
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.multiline,
                  onEditingComplete: (){
                    //点击发送调用
                    print('onEditingComplete');
                    onEditingCompleteText(controller.text);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    hintText: '请输入评论的内容',
                    isDense: true,
                    contentPadding: EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 10),
                    border: const OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),

                  ),
                  minLines: 1,
                  maxLines: 5,
                ),
              )
          )
        ],
      ),
    );
  }
}
