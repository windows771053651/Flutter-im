import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  widget.itemBean.praised = true;
                  widget.itemBean.praises.add(Praise(widget.userName));
                });
              } else {
                Praise delete = _getPraise();
                if (delete != null) {
                  setState(() {
                    widget.itemBean.praised = false;
                    widget.itemBean.praises.remove(delete);
                  });
                }
              }
            } else if (type == CommentBubbleWidget.COMMENT) {

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
        padding: EdgeInsets.only(left: 6, top: 4, right: 6, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: IMColors.c_10000000,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fabulousWidget(),
          ],
        ),
      );
    }
  }

  /// 点赞
  Widget _fabulousWidget() {
    if (widget.itemBean.praises.isEmpty) {
      return Container();
    } else {
      return Wrap(
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
      );
    }
  }
}
