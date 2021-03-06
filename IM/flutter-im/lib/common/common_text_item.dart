import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'package:flutter_im/resource/colors.dart';

class CommonTextItemView extends StatelessWidget {

  final String leftIconAssetPath;

  final IconData leftIcon;

  final bool leftIconVisible;

  final Color leftIconColor;

  final String leftTitle;

  final double leftTitleWidth;

  final String centerText;

  final Color centerTextColor;

  final VoidCallback callback;

  final double titleFontSize;

  final double iconSize;

  final bool arrowRightIconVisible;

  final String arrowRightIconAssetPath;

  final double arrowRightIconSize;

  final bool havePressEffect;

  final EdgeInsetsGeometry margin;

  final String rightText;

  final Color rightTextColor;

  final double rightTextFontSize;

  CommonTextItemView({
    Key key,
    this.leftIconAssetPath,
    this.leftIcon,
    this.leftIconColor = Colors.transparent,
    this.leftIconVisible = true,
    this.leftTitle = "",
    this.leftTitleWidth = 64,
    this.centerText = "",
    this.centerTextColor = IMColors.c_ff353535,
    this.callback,
    this.titleFontSize = 14,
    this.iconSize = 24,
    this.arrowRightIconVisible = true,
    this.arrowRightIconAssetPath = "images/icon_arrow_right.png",
    this.arrowRightIconSize = 16,
    this.havePressEffect = true,
    this.margin = const EdgeInsets.all(0),
    this.rightText = "",
    this.rightTextColor = Colors.grey,
    this.rightTextFontSize = 14,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
        callBack: callback,
        margin: margin,
        child: Container(
          constraints: BoxConstraints(
            minHeight: 50,
          ),
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
                    color: IMColors.c_ff353535,
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
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  rightText,
                  style: TextStyle(
                    fontSize: rightTextFontSize,
                    color: rightTextColor,
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