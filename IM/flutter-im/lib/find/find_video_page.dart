import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/gallery_bean.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/file_util.dart';

class FindVideoPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<FindVideoPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    List<GallerySubBean> videos = _getData();
    return RefreshIndicator(
      child: GridView.custom(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4.0,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            GallerySubBean gallerySubBean = videos[index];
            return TouchCallBack(
              child: Image.asset(
                FileUtil.getImagePath(gallerySubBean.thumb),
                fit: BoxFit.cover,
              ),
              callBack: () {
                Navigator.of(context).pushNamed(
                  PageId.GROUP_PERSONAL_AUDIO_PLAYING_PAGE,
                  arguments: [
                    gallerySubBean.videoTitle,
                    gallerySubBean.videoUrl
                  ],
                );
              },
            );
          },
          childCount: videos.length,
        ),
      ),
      onRefresh: () => _handlerRefresh(),
    );
  }

  Future<Null> _handlerRefresh() async {
    //模拟耗时5秒
    await new Future.delayed(new Duration(seconds: 3));
    return null;
  }

  @override
  bool get wantKeepAlive => true;
}

_getData() {
  return [
    GallerySubBean(
      thumb: "thumb_a",
      videoUrl: "assets/video/a.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_b",
      videoUrl: "assets/video/b.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_c",
      videoUrl: "assets/video/c.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_d",
      videoUrl: "assets/video/d.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_e",
      videoUrl: "assets/video/e.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_f",
      videoUrl: "assets/video/f.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_g",
      videoUrl: "assets/video/g.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_a",
      videoUrl: "assets/video/a.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_b",
      videoUrl: "assets/video/b.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_c",
      videoUrl: "assets/video/c.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_d",
      videoUrl: "assets/video/d.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_e",
      videoUrl: "assets/video/e.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_f",
      videoUrl: "assets/video/f.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_g",
      videoUrl: "assets/video/g.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_a",
      videoUrl: "assets/video/a.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_b",
      videoUrl: "assets/video/b.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_c",
      videoUrl: "assets/video/c.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_d",
      videoUrl: "assets/video/d.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_e",
      videoUrl: "assets/video/e.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
    GallerySubBean(
      thumb: "thumb_f",
      videoUrl: "assets/video/f.mp4",
      isVideo: true,
      videoTitle: "毛不易《体面》",
    ),
    GallerySubBean(
      thumb: "thumb_g",
      videoUrl: "assets/video/g.mp4",
      isVideo: true,
      videoTitle: "于文文成名曲",
    ),
  ];
}
