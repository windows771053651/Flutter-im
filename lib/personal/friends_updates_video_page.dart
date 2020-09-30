import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/personal/sub_view/gallery_listitem.dart';

import 'bean/gallery_bean.dart';

class FriendsUpdatesVideoPage extends StatelessWidget {

  const FriendsUpdatesVideoPage();

  @override
  Widget build(BuildContext context) {
    List<GalleryBean> gallery = getVideoDataResource();
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      color: Colors.white,
      child: ListView.builder(
        itemCount: gallery.length,
        itemBuilder: (context, index) {
          return GalleryItem(
            index: index,
            data: gallery[index],
            controller: (lastIndex) {
              return gallery[lastIndex];
            },
          );
        },
      ),
    );
  }
}