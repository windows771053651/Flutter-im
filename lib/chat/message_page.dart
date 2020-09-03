import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/bean/message_bean.dart';
import 'package:flutter_im/chat/sub_view/message_item.dart';


class MessagePage extends StatefulWidget {

  List<MessageData> dataResources = getMessageData();

  @override
  State createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.dataResources.length,
          itemBuilder: (BuildContext context, int index) {
            return MessageItem(widget.dataResources[index], onContextMenuSelected: (MessageData messageData, ContextMenuEnum type) {
              if (type == ContextMenuEnum.READ_STATE) {
                setState(() {
                  messageData.read = !messageData.read;
                });
              } else if (type == ContextMenuEnum.MESSAGE_TOPPING) {
                setState(() {
                  widget.dataResources.remove(messageData);
                  widget.dataResources.insert(0, messageData);
                });
              } else if (type == ContextMenuEnum.DELETE_MESSAGE) {
                setState(() {
                  widget.dataResources.remove(messageData);
                });
              }
            },);
          }
      ),
    );
  }
}