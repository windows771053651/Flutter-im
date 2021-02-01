import 'package:flutter/cupertino.dart';

class GalleryBean {
  String year;

  String month;

  List<GallerySubBean> gallery;

  GalleryBean({
    @required this.year,
    @required this.month,
    this.gallery,
  });
}

class GallerySubBean {
  String videoUrl;

  String thumb;

  bool isVideo;

  String videoTitle;

  GallerySubBean({
    this.videoUrl,
    this.thumb,
    this.isVideo = false,
    this.videoTitle,
  });
}

List<GalleryBean> getGalleryDataResource() {
  return [
    GalleryBean(
      year: "2020年",
      month: "4月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918948&di=1484f150718fbf4d44cd1d3732d8ef9d&imgtype=0&src=http%3A%2F%2Fctimgs.ctdsb.net%2Fuploadfile%2F2018%2F0919%2F20180919043547909.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918947&di=d572afef6df3271faceb2a9c0186c1d2&imgtype=0&src=http%3A%2F%2Fimg.51miz.com%2FElement%2F00%2F72%2F93%2F70%2F3b7daac0_E729370_bac5f3e3.jpg%2521%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue%2Fformat%2Fjpg",
        ),
      ],
    ),
    GalleryBean(
      year: "2020年",
      month: "3月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918945&di=feed3e8c6ed9170cc6387993e7281d0d&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1410%2F10%2Fc3%2F39492298_1412934288444.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918945&di=286b66b9a016823660a26d076feacc82&imgtype=0&src=http%3A%2F%2Fspider.nosdn.127.net%2F15df7de0f16e0bc708a47aaf3b6edb61.jpeg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918944&di=201a109a42edd08309ce67189debdf31&imgtype=0&src=http%3A%2F%2Fm.tuniucdn.com%2Ffilebroker%2Fcdn%2Ffilebroker%2Fcdn%2Fprd%2F76%2F3f%2F763fc58d98cfb838f90ddd2d0c76e643_w0_h600_c0_t0.jpeg",
        ),
        GallerySubBean(
          thumb:
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1699630866,74331411&fm=26&gp=0.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918940&di=12fa89f0348276843cc1da6b390ebb45&imgtype=0&src=http%3A%2F%2Fjc.wenming.cn%2Ftpbd%2F201503%2FW020150330314189497201.jpg",
        ),
      ],
    ),
    GalleryBean(
      year: "2020年",
      month: "2月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918945&di=feed3e8c6ed9170cc6387993e7281d0d&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1410%2F10%2Fc3%2F39492298_1412934288444.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918945&di=286b66b9a016823660a26d076feacc82&imgtype=0&src=http%3A%2F%2Fspider.nosdn.127.net%2F15df7de0f16e0bc708a47aaf3b6edb61.jpeg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918944&di=201a109a42edd08309ce67189debdf31&imgtype=0&src=http%3A%2F%2Fm.tuniucdn.com%2Ffilebroker%2Fcdn%2Ffilebroker%2Fcdn%2Fprd%2F76%2F3f%2F763fc58d98cfb838f90ddd2d0c76e643_w0_h600_c0_t0.jpeg",
        ),
        GallerySubBean(
          thumb:
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1699630866,74331411&fm=26&gp=0.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918940&di=12fa89f0348276843cc1da6b390ebb45&imgtype=0&src=http%3A%2F%2Fjc.wenming.cn%2Ftpbd%2F201503%2FW020150330314189497201.jpg",
        ),
      ],
    ),
    GalleryBean(
      year: "2020年",
      month: "1月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918940&di=91db72c613ee7e4547c89eff78e28cb5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F0%2F54854ad5839eb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601453612808&di=a1925b57ebb36b3eaaf6f648c28e638f&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1112%2F01%2Fc3%2F9811951_9811951_1322738097875_mthumb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018412&di=498d6accceb5303a51b78c11915b178a&imgtype=0&src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2F100p0p000000fei5qC742.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018409&di=20676488c45b67f0e1904813db86f437&imgtype=0&src=http%3A%2F%2Fwww.you1688.com%2Fwebeditor%2Fuploadfile%2F20171103115138903.jpg",
        ),
      ],
    ),
    GalleryBean(
      year: "2019年",
      month: "10月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918940&di=91db72c613ee7e4547c89eff78e28cb5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F0%2F54854ad5839eb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601453612808&di=a1925b57ebb36b3eaaf6f648c28e638f&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1112%2F01%2Fc3%2F9811951_9811951_1322738097875_mthumb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018412&di=498d6accceb5303a51b78c11915b178a&imgtype=0&src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2F100p0p000000fei5qC742.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018409&di=20676488c45b67f0e1904813db86f437&imgtype=0&src=http%3A%2F%2Fwww.you1688.com%2Fwebeditor%2Fuploadfile%2F20171103115138903.jpg",
        ),
      ],
    ),
    GalleryBean(
      year: "2019年",
      month: "9月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918940&di=91db72c613ee7e4547c89eff78e28cb5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F0%2F54854ad5839eb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601453612808&di=a1925b57ebb36b3eaaf6f648c28e638f&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1112%2F01%2Fc3%2F9811951_9811951_1322738097875_mthumb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018412&di=498d6accceb5303a51b78c11915b178a&imgtype=0&src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2F100p0p000000fei5qC742.jpg",
        ),
      ],
    ),
    GalleryBean(
      year: "2019年",
      month: "8月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601442918940&di=91db72c613ee7e4547c89eff78e28cb5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F0%2F54854ad5839eb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601453612808&di=a1925b57ebb36b3eaaf6f648c28e638f&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1112%2F01%2Fc3%2F9811951_9811951_1322738097875_mthumb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018412&di=498d6accceb5303a51b78c11915b178a&imgtype=0&src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2F100p0p000000fei5qC742.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018409&di=cf7a36a4df0a7b6aec588003a5b7ada9&imgtype=0&src=http%3A%2F%2Fgx.people.com.cn%2FNMediaFile%2F2017%2F0817%2FLOCAL201708171634000525433433742.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1419484173,391104746&fm=26&gp=0.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018408&di=431d3f8295bbb9150b876b184a436dd9&imgtype=0&src=http%3A%2F%2Fupload.chinadevelopment.com.cn%2F2018%2F0517%2F1526522564812.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018406&di=42b7953812c2ed8439afb7c7324cefae&imgtype=0&src=http%3A%2F%2Fb0.att.hudong.com%2F57%2F46%2F300000350841125853468926628_1024.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018406&di=246038f7512aff77f715f109785e871b&imgtype=0&src=http%3A%2F%2Fimg8.zol.com.cn%2Fbbs%2Fupload%2F13754%2F13753736.JPG",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018405&di=eced3e257eb97ab9dd652fe84c5d45d8&imgtype=0&src=http%3A%2F%2Fwww.516tx.com%2Fuploads%2Fallimg%2F140701%2F1-140F11AUa01.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443018405&di=ea409050d195dee4d70ce969476bd850&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn19%2F595%2Fw690h3105%2F20180404%2F1a8d-fysuuya5866863.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443300555&di=66235f46e1dd3ef81d5588664ce2b1fa&imgtype=0&src=http%3A%2F%2Fpaper.people.com.cn%2Ffcyym%2Fimages%2F2007-05%2F11%2F11786913335009389106201705074.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1101175306,2100293650&fm=26&gp=0.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443260494&di=fce73e64aa68e39627a60f8801a692db&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fphotoblog%2F1110%2F08%2Fc17%2F9202856_9202856_1318080319968_mthumb.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443260494&di=4ade75dc1a0ccea0014abd38842e76f3&imgtype=0&src=http%3A%2F%2Fm.tuniucdn.com%2Ffilebroker%2Fcdn%2Fsnc%2F3a%2F00%2F3a008d32577a8e5467d6b7837da13fbe_w800_h0_c0_t0.png",
        ),
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601443260489&di=fb66d88eb501d2b15641b760477b6b35&imgtype=0&src=http%3A%2F%2Fimage.kejixun.com%2F2020%2F0929%2F20200929035905421.jpg",
        ),
        GallerySubBean(
          thumb:
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2613663067,2454583290&fm=26&gp=0.jpg",
        )
      ],
    ),
  ];
}

List<GalleryBean> getVideoDataResource() {
  return [
    GalleryBean(
      year: "2020年",
      month: "4月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3043221178,131832452&fm=26&gp=0.jpg",
          videoUrl: "assets/video/a.mp4",
          isVideo: true,
          videoTitle: "于文文成名曲",
        ),
      ],
    ),
    GalleryBean(
      year: "2020年",
      month: "3月",
      gallery: [
        GallerySubBean(
          thumb:
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601455445793&di=4df15b76e84647d944b1206ec9e7d8bd&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F7Po3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fwh%3D450%2C600%3B%2Fsign%3De3edc6aec7ef76093c5e919b1bed8ffa%2F83025aafa40f4bfb14f45c670f4f78f0f73618d9.jpg",
          videoUrl: "assets/video/b.mp4",
          isVideo: true,
          videoTitle: "毛不易《体面》",
        ),
      ],
    ),
  ];
}
