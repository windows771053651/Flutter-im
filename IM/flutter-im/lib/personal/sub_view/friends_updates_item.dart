import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/bubble/popup_window.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/common/input_bottom_widget.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/database/friends_updates_manager_impl.dart';
import 'package:flutter_im/personal/bean/friends_updates_bean.dart';
import 'package:flutter_im/resource/colors.dart';
import 'package:flutter_im/utils/dialog_utils.dart';
import 'package:flutter_im/utils/file_util.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'comment_bubble.dart';
import 'friends_updates_item_link.dart';
import 'friends_updates_item_picture.dart';

class FriendsUpdatesItem extends StatefulWidget {

  static final double DIVIDER_LINE_HEIGHT = 0.5;

  FriendsUpdatesBean itemBean;

  String userName;

  String userId;

  OnItemDeleteCallback onItemDeleteCallback;

  bool deleteEnable;

  OnInputBottomVisible onInputBottomVisible;

  FriendsUpdatesItem({
    FriendsUpdatesBean itemBean,
    String userName,
    OnItemDeleteCallback onItemDeleteCallback,
    OnInputBottomVisible onInputBottomVisible,
  }) {
    this.itemBean = itemBean;
    this.userName = userName;
    this.userId = "${userName.hashCode}";
    if (itemBean.praises == null) {
      itemBean.praises = List();
    }
    if (itemBean.comments == null) {
      itemBean.comments = List();
    }
    this.onItemDeleteCallback = onItemDeleteCallback;
    this.onInputBottomVisible = onInputBottomVisible;
    deleteEnable = IMUtils.compareString(userName, itemBean.userName);
  }

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
            width: FriendsUpdatesItem.DIVIDER_LINE_HEIGHT,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.itemBean.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Visibility(
                  visible: widget.deleteEnable,
                  child: TouchCallBack(
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      "删除",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[700],
                      ),
                    ),
                    callBack: () {
                      DialogUtil.showBaseDialog(
                          context,
                          "",
                          title: "删除该动态",
                          right: "删除",
                          rightClick: () {
                            Future future = FriendsUpdatesManagerImpl.instance.deleteFriendsUpdatesBean(widget.itemBean.blogId);
                            if (future != null) {
                              future.then((onValue) {
                                print("朋友圈删除$onValue条数据");
                                widget.onItemDeleteCallback();
                              });
                            }
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
          CommentBubbleWidget((type) {
            if (type == CommentBubbleWidget.PRAISE) {
              if (!widget.itemBean.praised) {
                setState(() {
                  // 点赞
                  widget.itemBean.praised = true;
                  widget.itemBean.praises.add(Praise(userName:widget.userName, blogId:widget.itemBean.blogId));
                  // 更新数据库
                  FriendsUpdatesManagerImpl.instance.updateFriendsUpdatesBean(widget.userId, widget.itemBean);
                });
              } else {
                Praise delete = _getPraise();
                if (delete != null) {
                  setState(() {
                    // 取消点赞
                    widget.itemBean.praised = false;
                    widget.itemBean.praises.remove(delete);
                    // 更新数据库
                    FriendsUpdatesManagerImpl.instance.updateFriendsUpdatesBean(widget.userId, widget.itemBean);
                  });
                }
              }
            } else if (type == CommentBubbleWidget.COMMENT) {
              Future.delayed(Duration(milliseconds: 10), () {
                if (widget.onInputBottomVisible != null) {
                  widget.onInputBottomVisible(context);
                }
                Navigator.push(
                  context,
                  PopRoute(
                    child: InputBottomWidget(
                      onEditingCompleteText: (text) {
                        setState(() {
                          // 评论
                          widget.itemBean.comments.add(Comment(userName: widget.userName, content: text, blogId: widget.itemBean.blogId));
                          // 更新数据库
                          FriendsUpdatesManagerImpl.instance.updateFriendsUpdatesBean(widget.userId, widget.itemBean);
                        });
                      },
                    ),
                  ),
                );
              });
            }
          }, widget.itemBean.praised),
        ],
      ),
    );
  }

  /// 评论、点赞
  Widget _commentAndFabulousWidget() {
    if (IMUtils.isListEmpty(widget.itemBean.comments) && IMUtils.isListEmpty(widget.itemBean.praises)) {
      return Container();
    } else {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 6),
        padding: EdgeInsets.only(top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: IMColors.c_FFF7F7F7,
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
    if (IMUtils.isListEmpty(widget.itemBean.praises) || IMUtils.isListEmpty(widget.itemBean.comments)) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(top: 4, bottom: 4),
        child: HorizontalLine(color: IMColors.c_FFDEDEDE,),
      );
    }
  }

  /// 点赞
  Widget _fabulousWidget() {
    if (IMUtils.isListEmpty(widget.itemBean.praises)) {
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
    if (IMUtils.isListEmpty(widget.itemBean.comments)) {
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
}

typedef OnItemDeleteCallback = Function();

typedef OnInputBottomVisible = Function(BuildContext context);