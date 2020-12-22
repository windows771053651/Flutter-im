import 'package:flutter/cupertino.dart';
import 'package:lpinyin/lpinyin.dart';

class ContactVO {
  String seationKey;

  String name;

  String avatarUrl;

  String serialNum;

  String initials;

  ContactVO({
    @required this.seationKey,
    this.name,
    this.avatarUrl,
    this.serialNum,
  });
}

List<ContactVO> getContactData() {
  List<ContactVO> data = _handleInitials();
  data.sort((left, right) => left.initials.compareTo(right.initials));

  return data;
}

List<ContactVO> _handleInitials() {
  List<ContactVO> data = _getContactMetaData();
  data.forEach((bean) {
    bean.initials = PinyinHelper.getPinyinE(bean.name, separator: " ", defPinyin: '#', format: PinyinFormat.WITHOUT_TONE).toUpperCase().substring(0, 1);
  });
  return data;
}

List<ContactVO> _getContactMetaData() {
  return [
    ContactVO(
      name: "科比",
      avatarUrl: "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1235218559,506015443&fm=26&gp=0.jpg",
      serialNum: "kobe",
    ),
    ContactVO(
      name: "乔巴",
      avatarUrl: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1599219339,2780337292&fm=26&gp=0.jpg",
      serialNum: "qiaoba",
    ),
    ContactVO(
      name: "路飞",
      avatarUrl: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=497426468,2622892593&fm=26&gp=0.jpg",
      serialNum: "lufei",
    ),
    ContactVO(
      name: "古力娜扎",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598891453746&di=e54fdb6d8cefa644ea1263e540ebb180&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn16%2F720%2Fw1920h1200%2F20181117%2Fe377-hnyuqhh4897269.jpg",
      serialNum: "nazha",
    ),
    ContactVO(
      name: "娜美",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598952744114&di=e1490511231a2250cdada340b3b4ecee&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201408%2F29%2F20140829224055_FdeMU.jpeg",
      serialNum: "namei",
    ),
    ContactVO(
      name: "罗宾",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598952770625&di=7f7f8bd521f97ef0c7dc798ae52caf2b&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Fe1a356ca4c7de4e64c2de4d71dcbb49a20dd623c.jpg",
      serialNum: "luobin",
    ),
    ContactVO(
      name: "乌索普",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598952801168&di=f6324af2405c07237e053a1bee651f07&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180811%2F40e6154fe0464a44aee8c2d2ab3ba4d8.jpeg",
      serialNum: "wusuopu",
    ),
    ContactVO(
      name: "索隆",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598952900929&di=99bbfb81dbb284e54f376f0482cff568&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181224%2F1c46e7f1086047cf91d617a6b7eafb8f.jpeg",
      serialNum: "suolong",
    ),
    ContactVO(
      name: "山治",
      avatarUrl: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=95678857,1304121916&fm=26&gp=0.jpg",
      serialNum: "shanzhi",
    ),
    ContactVO(
      name: "张敏",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953011670&di=792fed58f4ebe92e2fc2850c315713f4&imgtype=0&src=http%3A%2F%2Fp1.ssl.cdn.btime.com%2Ft0142ba7fd7c224f792.jpg%3Fsize%3D640x399",
      serialNum: "zhangmin",
    ),
    ContactVO(
      name: "李嘉欣",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953035169&di=4acf15e5d17e3ae6cda3bb0e3850527d&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ffront%2F340%2Fw746h394%2F20181201%2FoDJt-hpevhcm6598246.png",
      serialNum: "lijiaxin",
    ),
    ContactVO(
      name: "钟欣潼",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953075951&di=a4cbb1b817bf2dc63be6a7e92c617ac5&imgtype=0&src=http%3A%2F%2Fp.ssl.qhimg.com%2Fd%2Fdy_399e138b358fc0993ae1ab517d900ca3.jpg",
      serialNum: "zhongxintong",
    ),
    ContactVO(
      name: "剑火鬼炙",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953124065&di=da7406fc4c3c0d1e4ee7f47636c7b582&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20160725%2FImg460826517.jpg",
      serialNum: "jianhuoguizhi",
    ),
    ContactVO(
      name: "地狱火",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953257629&di=bf2391133da3640bfe10629ae53f1e28&imgtype=0&src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F8547655793%2F1000",
      serialNum: "diyuhuo",
    ),
    ContactVO(
      name: "轻狂书生",
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598953293322&di=be206effa4287e8b8514361c51606be1&imgtype=0&src=http%3A%2F%2Faliimg.changba.com%2Fcache%2Fphoto%2F387176257_640_640.jpg",
      serialNum: "qingkuangshusheng",
    ),
  ];
}
