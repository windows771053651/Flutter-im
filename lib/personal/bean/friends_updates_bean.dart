class FriendsUpdatesBean {
  final String userName;

  final String avatarUrl;

  final String title;

  final List<String> icons;

  final FriendsUpdatesLink link;

  final List<String> replyInfo;

  FriendsUpdatesBean({
    this.userName,
    this.avatarUrl,
    this.title,
    this.icons,
    this.link,
    this.replyInfo,
  });

  @override
  String toString() {
    return 'FriendsUpdatesBean{userName: $userName, avatarUrl: $avatarUrl, title: $title, icons: $icons, link: $link, replyInfo: $replyInfo}';
  }

}

class FriendsUpdatesLink {
  final String icon;

  final String title;

  final String subTitle;

  final String link;

  FriendsUpdatesLink({
    this.icon,
    this.title,
    this.subTitle,
    this.link,
  });
}

List<FriendsUpdatesBean> getFriendsUpdatesDataResource() {
  return [
    FriendsUpdatesBean(
      userName: "科比",
      avatarUrl: "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1235218559,506015443&fm=26&gp=0.jpg",
      title: "回家挖地瓜还要转二里地，不好",
      icons: [
        "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3575632660,1307405780&fm=26&gp=0.jpg",
      ],
    ),
    FriendsUpdatesBean(
      userName: "乔巴",
      avatarUrl: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1599219339,2780337292&fm=26&gp=0.jpg",
      title: "加油",
      icons: [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664071953&di=8df84e59f97e11fa5b615868ac170930&imgtype=0&src=http%3A%2F%2Fdmimg.5054399.com%2Fallimg%2Foptuji%2Fopsct%2F2.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664071953&di=e16861bdfabc6b80e3de945422d9aa91&imgtype=0&src=http%3A%2F%2Fwww.pptbz.com%2Fd%2Ffile%2Fp%2F201612%2F822c78eb2a9e9ea4405ba25f85c3883f.jpg",
      ],
    ),
    FriendsUpdatesBean(
      userName: "路飞",
      avatarUrl: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=497426468,2622892593&fm=26&gp=0.jpg",
      title: "明天去打黑胡子去",
      icons: [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664071953&di=8df84e59f97e11fa5b615868ac170930&imgtype=0&src=http%3A%2F%2Fdmimg.5054399.com%2Fallimg%2Foptuji%2Fopsct%2F2.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664071953&di=e16861bdfabc6b80e3de945422d9aa91&imgtype=0&src=http%3A%2F%2Fwww.pptbz.com%2Fd%2Ffile%2Fp%2F201612%2F822c78eb2a9e9ea4405ba25f85c3883f.jpg",
      ],
    ),
    FriendsUpdatesBean(
      userName: "古力娜扎",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598891453746&di=e54fdb6d8cefa644ea1263e540ebb180&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn16%2F720%2Fw1920h1200%2F20181117%2Fe377-hnyuqhh4897269.jpg",
      title: "做女人太难了\n图个玩玩吧",
      icons: [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664253159&di=20a21c59efcbece390721495a18619a1&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-1ae9b2bbc17daaeb0a5d12184063a30f_hd.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664253153&di=5bb501395df2a04af226d1d11f619389&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F17%2F12%2F02%2F1e007aac329bf4c3dcd4292e30f74c8a.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664347197&di=e2ac0b13c397d1fdbaac5c3883edcfc5&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2FgLzDIHrVOl4NDzR7I4hQsFr%3Dwtm4dlRpJm0qZycw188vK1507101383672compressflag.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664419531&di=54c261594dbac44f726e3df8e8c4c5a6&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn09%2F547%2Fw600h747%2F20180513%2F45a2-hamfahx4094936.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664473930&di=24d3419f9e5546b5ddd28b3f92d25f93&imgtype=0&src=http%3A%2F%2Fimages.hongfen.org%2Fallimg%2F191111%2F2Z_1111235321a93.jpg%3F114_150",
      ],
    ),
    FriendsUpdatesBean(
      userName: "娜美",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598952744114&di=e1490511231a2250cdada340b3b4ecee&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201408%2F29%2F20140829224055_FdeMU.jpeg",
      title: "久违的蓝天白云\n适合大沙发躺尸",
      icons: [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664706070&di=60a5419bc896a3141988e4ef04b46ef9&imgtype=0&src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F85b4c85cc72e696ba9f2cf6ab58edf218ae70906.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664770328&di=30e783223eb076e854794b432faa07e7&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201408%2F29%2F20140829224055_FdeMU.jpeg",
      ],
    ),
    FriendsUpdatesBean(
      userName: "罗宾",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598952770625&di=7f7f8bd521f97ef0c7dc798ae52caf2b&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fe1a356ca4c7de4e64c2de4d71dcbb49a20dd623c.jpg",
      title: "和娜美一起在家躺尸",
      icons: [
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664942575&di=4f17c645950e4b52cd2abc43964329cf&imgtype=0&src=http%3A%2F%2Fimg.ewebweb.com%2Fuploads%2F20190929%2F23%2F1569771268-wxRzNEtJeW.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600664962324&di=2335d7acbea6bd4bf09b6d11fbfcf7ff&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201607%2F01%2F20160701184747_BP2iZ.jpeg",
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=616293035,1901278771&fm=26&gp=0.jpg",
      ],
    ),
    FriendsUpdatesBean(
      userName: "李嘉欣",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953035169&di=4acf15e5d17e3ae6cda3bb0e3850527d&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ffront%2F340%2Fw746h394%2F20181201%2FoDJt-hpevhcm6598246.png",
      title: "今天去海边",
      icons: [
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1468919391,1277842569&fm=26&gp=0.jpg",
      ],
    ),
    FriendsUpdatesBean(
      userName: "山治",
      avatarUrl: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=95678857,1304121916&fm=26&gp=0.jpg",
      title: "谁再敢调戏娜美、罗宾我踢死他",
    ),

    FriendsUpdatesBean(
      userName: "钟欣潼",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953075951&di=a4cbb1b817bf2dc63be6a7e92c617ac5&imgtype=0&src=http%3A%2F%2Fp.ssl.qhimg.com%2Fd%2Fdy_399e138b358fc0993ae1ab517d900ca3.jpg",
      link: FriendsUpdatesLink(
        icon: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600667308476&di=6187a69f6899943379f62681456d1618&imgtype=0&src=http%3A%2F%2Fwww.52doutuwang.com%2Fueditor%2Fphp%2Fupload%2Fimage%2F20180908%2F1536399094425240.jpg",
        title: "破茧(《斗罗大陆》动画2020年新主题曲)",
        subTitle: "张韶涵",
        link: "https://y.qq.com/n/yqq/album/001gTzQA1I61B3.html",
      ),
    ),
  ];
}