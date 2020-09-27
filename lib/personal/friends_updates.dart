import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/bottom_sheet_dialog.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/personal_constant.dart';
import 'package:flutter_im/personal/sub_view/friends_updates_header.dart';
import 'package:flutter_im/personal/sub_view/friends_updates_item.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo/photo.dart';
import 'bean/friends_updates_bean.dart';
import 'package:photo_manager/photo_manager.dart';

class FriendsUpdates extends StatefulWidget {
  @override
  State createState() => _FriendsUpdatesState();
}

class _FriendsUpdatesState extends State<FriendsUpdates> {

  bool _isFirst = true;

  String _name;

  String _avatarUrl;

  List<FriendsUpdatesBean> dataResources;

  ScrollController _controller;

  bool _titleVisible = false;

  void _initParams(BuildContext context) {
    List<String> arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null && arguments.length == 2) {
      _name = arguments[0];
      _avatarUrl = arguments[1];
      dataResources = getFriendsUpdatesDataResource();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      double offset = _controller.offset;
      if (offset < MediaQuery.of(context).size.width / PersonalConstant.friendsUpdatesHeaderBgRatio * (1 / 2)) {
        setState(() {
          _titleVisible = false;
        });
      } else {
        setState(() {
          _titleVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      _initParams(context);
    }

    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            actions: <Widget>[
              TouchCallBack(
                normalColor: Colors.transparent,
                pressedColor: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Icon(Icons.photo_camera, color: Colors.white,),
                callBack: () {
                  _displayFriendsUpdatesDialog();
                },
              ),
            ],
            expandedHeight: MediaQuery.of(context).size.width / PersonalConstant.friendsUpdatesHeaderBgRatio,
            flexibleSpace: FlexibleSpaceBar(
              title: Visibility(
                visible: _titleVisible,
                child: Text(
                  "好友动态",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              background: FriendsUpdatesHeader(name: _name, avatarUrl: _avatarUrl,),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return FriendsUpdatesItem(dataResources[index]);
            }, childCount: dataResources.length,),
          ),
        ],
      ),
    );
  }

  /// 朋友圈图片或者拍照对话框
  void _displayFriendsUpdatesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var list = List();
        list.add('拍摄图片');
        list.add('从相册选择');
        return BottomSheetWidget(
          list: list,
          onItemClickListener: (index) async {
            Navigator.pop(context);
            switch(index) {
              case 0:
                _takePhoto(context);
                break;
              case 1:
                _testPhotoListParams();
                break;
            }
          },
        );
      },
    );
  }

  /*相册*/
  void _testPhotoListParams() async {
    var assetPathList = await PhotoManager.getImageAsset();
    _openGallery(pathList: assetPathList);
  }

  /*相册*/
  _openGallery({List<AssetPathEntity> pathList}) async {
    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
      context: context,
      themeColor: Colors.green,
      textColor: Colors.white,
      padding: 1.0,
      dividerColor: Colors.grey,
      disableColor: Colors.grey.shade300,
      itemRadio: 0.88,
      maxSelected: 9,
      provider: I18nProvider.chinese,
      rowCount: 4,
      thumbSize: 150,
      sortDelegate: SortDelegate.common,
      checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
        activeColor: Colors.white,
        unselectedColor: Colors.white,
        checkColor: Colors.green,
      ),
      badgeDelegate: const DurationBadgeDelegate(),
      pickType: PickType.onlyImage,
      photoPathList: pathList,
    );

    if (imgList != null || imgList.isNotEmpty) {
      List<String> nativePictureAbsPath = [];
      for (var e in imgList) {
        var file = await e.file;
        nativePictureAbsPath.add(file.absolute.path);
      }
      _publishFriendsUpdates(nativePictureAbsPath);
    }
  }

    /// 拍照
  _takePhoto(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null && image.existsSync()) {
      _publishFriendsUpdates([image.path]);
    }
  }

  /// 发布朋友圈
  _publishFriendsUpdates(List pictures) {
    Future future = Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_PUBLISH_FRIENDS_UPDATES, arguments: [_name, _avatarUrl, pictures]);
    future.then((onValue) {
      if (onValue != null) {
        setState(() {
          FriendsUpdatesBean bean = onValue;
          dataResources.insert(0, bean);
          _scrollToTop();
        });
      }
    });
  }

  /// 滚动到顶部
  _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
}