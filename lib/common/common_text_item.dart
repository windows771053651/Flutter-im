import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';

class CommonTextItemView extends StatelessWidget {

  String leftIconAssetPath;

  IconData leftIcon;

  bool leftIconVisible;

  Color leftIconColor;

  String leftTitle;

  double leftTitleWidth;

  String centerText;

  Color centerTextColor;

  VoidCallback callback;

  double titleFontSize;

  double iconSize;

  bool arrowRightIconVisible;

  String arrowRightIconAssetPath;

  double arrowRightIconSize;

  bool havePressEffect;

  CommonTextItemView({
    Key key,
    this.leftIconAssetPath,
    this.leftIcon,
    this.leftIconColor = Colors.transparent,
    this.leftIconVisible = true,
    this.leftTitle = "",
    this.leftTitleWidth = 64,
    this.centerText = "",
    this.centerTextColor = const Color(0xff353535),
    this.callback,
    this.titleFontSize = 14,
    this.iconSize = 24,
    this.arrowRightIconVisible = true,
    this.arrowRightIconAssetPath = "images/icon_arrow_right.png",
    this.arrowRightIconSize = 16,
    this.havePressEffect = true,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
        callBack: callback,
        child: Container(
          height: 50,
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Row(
            children: <Widget>[
              _getLeftIcon(),
              Container(
                margin: EdgeInsets.only(left: 4),
                width: leftTitleWidth,
                child: Text(
                  leftTitle,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    color: Color(0xff353535),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(
                    centerText,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      color: centerTextColor,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: arrowRightIconVisible,
                child: Image.asset(
                  arrowRightIconAssetPath,
                  width: arrowRightIconSize,
                  height: arrowRightIconSize,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget _getLeftIcon() {
    if (leftIconVisible && (leftIconAssetPath != null || leftIcon != null)) {
      return leftIconAssetPath != null
          ? Image.asset(leftIconAssetPath, width: iconSize, height: iconSize, fit: BoxFit.cover,)
          : Icon(leftIcon, color: leftIconColor,);
    } else {
      return Container();
    }
  }
}