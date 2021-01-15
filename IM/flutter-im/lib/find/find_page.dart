import 'package:flutter/cupertino.dart';
import 'package:flutter_im/common/common_text_item.dart';
import 'package:flutter_im/common/horizontal_line.dart';
import 'package:flutter_im/constants/constants.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';

class FindPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CommonTextItemView(
          leftIconAssetPath: FileUtil.getImagePath("icon_me_friends"),
          leftTitle: "好友动态",
          callback: () {
            Navigator.of(context).pushNamed(PageId.GROUP_FIND_FRIENDS_UPDATES, arguments: [Constants.userName, Constants.userAvatar]);
          },
        ),
        HorizontalLine(height: 6,),
        CommonTextItemView(
          leftIconAssetPath: FileUtil.getImagePath("find_near_friends_icon"),
          leftTitle: "附近的直播和人",
          leftTitleWidth: 200,
          callback: () {
            Navigator.of(context).pushNamed(PageId.GROUP_FIND_PEOPLE_NEARBY_PAGE);
          },
        ),
        HorizontalLine(height: 6,),
        CommonTextItemView(
          leftIconAssetPath: FileUtil.getImagePath("find_game_icon"),
          leftTitle: "游戏",
        ),
        HorizontalLine(height: 6,),
        CommonTextItemView(
          leftIconAssetPath: FileUtil.getImagePath("find_applets_icon"),
          leftTitle: "小程序",
        ),
      ],
    );
  }
}