import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/find/sub_view/people_nearby_app_bar.dart';
import 'package:flutter_im/personal/bean/gallery_page_tab_view.dart';

import 'find_live_page.dart';
import 'find_nearby_page.dart';
import 'find_video_page.dart';

class PeopleNearbyPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<PeopleNearbyPage> {

  List<TabBean> tabBeans = const [
    TabBean(name: "视频"),
    TabBean(name: "直播"),
    TabBean(name: "附近的人"),
  ];

  List<Widget> pages = [
    FindVideoPage(),
    FindLivePage(),
    FindNearbyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBeans.length,
      child: Scaffold(
        appBar: PeopleNearbyAppBarWidget(tabBeans: tabBeans),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }
}