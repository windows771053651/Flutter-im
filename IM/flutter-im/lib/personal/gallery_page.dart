import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';

import 'bean/gallery_page_tab_view.dart';
import 'friends_updates_gallery_page.dart';
import 'friends_updates_video_page.dart';

/// 我的相册
class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    const List<TabBean> tabBeans = const [
      TabBean(name: "动态相册"),
      TabBean(name: "视频动态"),
    ];

     List<Widget> pages = const [
      FriendsUpdatesGalleryPage(),
      FriendsUpdatesVideoPage(),
    ];

    return DefaultTabController(
      length: tabBeans.length,
      child: Scaffold(
        appBar: getAppBar(
          context,
          leftTitle: "相册",
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Material(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.green,
                indicatorWeight: 3,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.green,
                tabs: tabBeans.map((TabBean tabBean) {
                  return Tab(
                    text: tabBean.name,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }
}
