import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/personal/bean/gallery_page_tab_view.dart';
import 'package:flutter_im/utils/file_util.dart';

class PeopleNearbyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  final double elevation; //阴影

  final Widget leading;

  final List<TabBean> tabBeans;

  const PeopleNearbyAppBarWidget({
    Key key,
    this.height: 40.0,
    this.elevation: 0.5,
    this.leading,
    this.tabBeans,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Stack(
        children: <Widget>[
          buildAppBar(context, '', leading:leading),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: PreferredSize(
              preferredSize: Size.fromHeight(height),
              child: Material(
                color: Colors.white,
                child: Row(
                  children: [
                    TouchCallBack(
                      minHeight: height,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Image.asset(
                        FileUtil.getImagePath("icon_arrow_left"),
                        width: 20,
                        height: 20,
                        color: Colors.green,
                      ),
                      callBack: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Container(
                      width: 40,
                    ),
                    Expanded(
                      child: PreferredSize(
                        preferredSize: Size.fromHeight(height),
                        child: Material(
                          color: Colors.white,
                          child: TabBar(
                            labelColor: Colors.green,
                            indicatorWeight: 2,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.green,
                            indicatorPadding: EdgeInsets.only(left: 16, right: 16),
                            labelPadding: EdgeInsets.zero,
                            tabs: tabBeans.map((TabBean tabBean) {
                              return Tab(
                                child: Container(
                                  child: Text(tabBean.name),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                    ),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
      preferredSize: Size.fromHeight(height),
    );
  } //这里设置控件（appBar）的高度

  Widget buildAppBar(
      BuildContext context,
      String text, {
        double fontSize: 18.0,
        double height: 40.0,
        double elevation: 0.5,
        Widget leading,
        bool centerTitle: false,
      }) {
    return PreferredSize(
        child: AppBar(
          elevation: elevation, //阴影
          centerTitle: centerTitle,
          title: Text(text, style: TextStyle(fontSize: fontSize)),
          leading: leading,
        ),
        preferredSize: Size.fromHeight(height));
  }
}