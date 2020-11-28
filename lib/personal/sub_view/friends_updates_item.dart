import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'comment_bubble.dart';
import 'friends_updates_item_link.dart';
import 'friends_updates_item_picture.dart';

class FriendsUpdatesItem extends StatefulWidget {
  final FriendsUpdatesBean itemBean;

  final String userName;

  FriendsUpdatesItem(this.itemBean, this.userName);

  @override
  State createState() => _State();
}

class _State extends State<FriendsUpdatesItem> {

  Praise _getPraise() {
    if (IMUtils.isListEmpty(widget.itemBean.praises) || IMUtils.isStringEmpty(widget.userName)) {
      return null;
    }
    Praise praise;
    widget.itemBean.praises.forEach((element) {
      if (IMUtils.compareString(widget.userName, element.userName)) {
        praise = element;
      }
    });
    return praise;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: IMColors.c_fff5f5f5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IMUtils.getClipRRectImage(
            networkUrl: widget.itemBean.avatarUrl,
            width: 34,
            height: 34,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _getItemWidget(context),
                  _itemTimeAndBubbleWidget(),
                  _commentAndFabulousWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 除点赞、评论、时间、菜单(点赞、评论功能菜单)区域以外的widget
  Widget _getItemWidget(BuildContext context) {
    if (widget.itemBean.link != null) {
      return FriendsUpdatesItemLink(widget.itemBean);
    } else {
      return FriendsUpdatesItemPicture(widget.itemBean);
    }
  }

  /// 时间和菜单
  Widget _itemTimeAndBubbleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              widget.itemBean.time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          CommentBubbleWidget((type) {
            if (type == CommentBubbleWidget.PRAISE) {
              if (!widget.itemBean.praised) {
                setState(() {
                  // 点赞
                  widget.itemBean.praised = true;
                  widget.itemBean.praises.add(Praise(userName:widget.userName, blogId:widget.itemBean.blogId));
                });
              } else {
                Praise delete = _getPraise();
                if (delete != null) {
                  setState(() {
                    // 取消点赞
                    widget.itemBean.praised = false;
                    widget.itemBean.praises.remove(delete);
                  });
                }
              }
            } else if (type == CommentBubbleWidget.COMMENT) {
              Future.delayed(Duration(milliseconds: 10), () {
                showReplyDialog();
//                Navigator.push(
//                  context,
//                  PopRoute(
//                    child: InputButtomWidget(
//                      onEditingCompleteText: (text) {
//                        print('点击发送 ---$text');
//                      },
//                    ),
//                  ),
//                );
              });
            }
          }, widget.itemBean.praised),
        ],
      ),
    );
  }

  /// 评论、点赞
  Widget _commentAndFabulousWidget() {
    if (widget.itemBean.comments.isEmpty && widget.itemBean.praises.isEmpty) {
      return Container();
    } else {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 6),
        padding: EdgeInsets.only(top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: IMColors.c_10000000,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fabulousWidget(),
            _horizontalLine(),
            _commentWidget(),
          ],
        ),
      );
    }
  }

  /// 点赞和评论区域之间的横线
  Widget _horizontalLine() {
    if (widget.itemBean.praises.isEmpty || widget.itemBean.comments.isEmpty) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(top: 4, bottom: 4),
        child: HorizontalLine(color: Colors.grey[300],),
      );
    }
  }

  /// 点赞
  Widget _fabulousWidget() {
    if (widget.itemBean.praises.isEmpty) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(left: 6, right: 6),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(widget.itemBean.praises.length, (index) {
            return index == 0 ?
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(FileUtil.getImagePath("praise_icon"), ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text(
                    widget.itemBean.praises[index].userName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ],
            )
                : Text(
              "，${widget.itemBean.praises[index].userName}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue[700],
              ),
            );
          }),
        ),
      );
    }
  }

  /// 评论列表
  Widget _commentWidget() {
    if (widget.itemBean.comments.isEmpty) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(left: 6, right: 6),
        child: Column(
          children: List.generate(widget.itemBean.comments.length, (index) {
            Comment comment = widget.itemBean.comments[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${comment.userName}：",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue[700],
                  ),
                ),
                Expanded(
                  child: Text(
                    comment.content,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      );
    }
  }

  /// 弹出评论框
  void showReplyDialog() {
    String content = "";
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 12, right: 12,),
                  padding: EdgeInsets.all(4),
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: IMColors.c_ffededed, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLines: 10,
                          minLines: 1,
                          showCursor: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintText: "评论",
                            hintStyle: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          onChanged: (value) {
                            content = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                TouchCallBack(
                  bottomRightRadius: 4,
                  bottomLeftRadius: 4,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  margin: EdgeInsets.only(top: 12),
                  child: Center(
                    child: Text(
                      "发送",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[700],
                      ),
                    ),
                  ),
                  callBack: () {
                    if (IMUtils.isStringNotEmpty(content)) {
                      Navigator.of(context).pop();
                      setState(() {
                        // 评论
                        widget.itemBean.comments.add(Comment(userName: widget.userName, content: content, blogId: widget.itemBean.blogId));
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
