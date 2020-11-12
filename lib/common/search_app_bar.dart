import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double elevation; //阴影
  final Widget leading;
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final IconData prefixIcon;
  final List<TextInputFormatter> inputFormatters;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onChanged;

  const SearchAppBarWidget({
    Key key,
    this.height: 50.0,
    this.elevation: 0.5,
    this.leading,
    this.hintText: '请输入关键词',
    this.focusNode,
    this.controller,
    this.inputFormatters,
    this.onEditingComplete,
    this.prefixIcon: Icons.search,
    this.onChanged,
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
            padding: EdgeInsets.only(left: 64.0, top: MediaQuery.of(context).padding.top - 4, right: 8),
            child: TextField(
              focusNode: focusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: controller,
              maxLines: 1,
              inputFormatters:inputFormatters,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
              ),
              onEditingComplete: onEditingComplete,
              onChanged: onChanged,
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
        double height: 50.0,
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