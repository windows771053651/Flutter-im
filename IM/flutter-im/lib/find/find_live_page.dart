import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/find/bean/live_bean.dart';
import 'package:flutter_im/find/sub_view/live_page_item.dart';

class FindLivePage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<FindLivePage> with AutomaticKeepAliveClientMixin {


  @override
  Widget build(BuildContext context) {
    List<LiveBean> dataResource = getLiveData();
    double itemWidth = (MediaQuery.of(context).size.width - 4 * 3) / 2;

    return RefreshIndicator(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(4),
        child: GridView.custom(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            crossAxisCount: 2,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return LiveItem(
                liveBean: dataResource[index],
                itemWidth: itemWidth,
              );
            },
            childCount: dataResource.length,
          ),
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
