import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/chat/message_page.dart';
import 'package:flutter_im/contacts/contacts_page.dart';
import 'package:flutter_im/personal/personal_page.dart';
import 'package:flutter_im/router/page_id.dart';

class App extends StatefulWidget {
  @override
  State createState() => AppState();
}

class AppState extends State<App> {

  /// 消息tab
  static const int TAB_MESSAGE = 0;

  /// 联系人tab
  static const int TAB_CONTACTS = 1;

  /// 我的tab
  static const int TAB_PERSONAL = 2;

  /// 右上角菜单：发起会话
  static const int MENU_TAB_GROUP_CHAT = 0;

  /// 右上角菜单：添加好友
  static const int MENU_TAB_ADD_FRIENDS = 1;

  /// 右上角菜单：联系客服
  static const int MENU_TAB_SERVICE = 2;

  /// 当前选中页面对应的索引
  int _currentIndex = TAB_MESSAGE;

  final bodyList = [MessagePage(), ContactsPage(), PersonalPage()];

  PopupMenuItem _popupMenuItem(String title, int value, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      value: value,
      child:Row(
        children: <Widget>[
          imagePath == null
              ? SizedBox(width: 24, height: 24, child: Icon(icon, color: Colors.white,),)
              : Image.asset(imagePath, width: 24, height: 24,),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "即时通讯",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              Navigator.of(context).pushNamed(PageId.GROUP_PERSONAL_SEARCH);
            },
          ),
          PopupMenuButton(
            offset: Offset(0, 50),
            icon: Icon(Icons.add),
            itemBuilder: (context) {
              return [
                _popupMenuItem("发起会话", MENU_TAB_GROUP_CHAT, imagePath: "images/icon_menu_group.png"),
                _popupMenuItem("添加好友", MENU_TAB_ADD_FRIENDS, imagePath: "images/icon_menu_addfriend.png"),
                _popupMenuItem("联系客服", MENU_TAB_SERVICE, imagePath: "images/icon_menu_service.png"),
              ];
            },
            onSelected: (value) {
              switch(value) {
                case MENU_TAB_GROUP_CHAT:
                  // 发起会话
                  break;
                case MENU_TAB_ADD_FRIENDS:
                  // 添加好友
                  break;
                case MENU_TAB_SERVICE:
                  // 联系客服
                  break;
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _getBottomNavigationBarItem(TAB_MESSAGE, "images/message_normal.png", "images/message_pressed.png"),
          _getBottomNavigationBarItem(TAB_CONTACTS, "images/contact_list_normal.png", "images/contact_list_pressed.png"),
          _getBottomNavigationBarItem(TAB_PERSONAL, "images/profile_normal.png", "images/profile_pressed.png"),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: bodyList,
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(int index, String normalIconPath, String pressedIconPath) {
    return BottomNavigationBarItem(
      title: Text(
        getLabel(index),
        style: TextStyle(
          color: _currentIndex == index ? Color(0xFF46c01b) : Color(0xFF999999),
          fontSize: 12,
        ),
      ),
      icon: _currentIndex == index
          ? Image.asset(pressedIconPath, width: 24, height: 24, fit: BoxFit.cover,)
          : Image.asset(normalIconPath, width: 24, height: 24, fit: BoxFit.cover,),
    );
  }

  String getLabel(int index) {
    String label = "";
    switch(index) {
      case TAB_MESSAGE:
        label = "聊天";
        break;
      case TAB_CONTACTS:
        label = "通讯录";
        break;
      case TAB_PERSONAL:
        label = "我";
        break;
    }
    return label;
  }
}