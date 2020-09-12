import 'package:flutter/cupertino.dart';
import 'package:flutter_im/app.dart';
import 'package:flutter_im/chat/chat_background_settings_page.dart';
import 'package:flutter_im/chat/chat_page.dart';
import 'package:flutter_im/chat/chat_settings_page.dart';
import 'package:flutter_im/chat/system_message_page.dart';
import 'package:flutter_im/contacts/friend_permission_settings.dart';
import 'package:flutter_im/contacts/new_friends_page.dart';
import 'package:flutter_im/contacts/phone_contacts_page.dart';
import 'package:flutter_im/contacts/remarks_settings.dart';
import 'package:flutter_im/contacts/user_info_page.dart';
import 'package:flutter_im/personal/social_updates.dart';
import 'package:flutter_im/contacts/stranger_validation_page.dart';
import 'package:flutter_im/router/page_id.dart';
import '../personal/image_display_page.dart';
import '../personal/search_page.dart';
import '../personal/webview_loading_page.dart';

class RouterManager {
  static Map<String, WidgetBuilder> _routers = {
    /// 主模块
    PageId.GROUP_MAIN: (context) => App(),
    PageId.GROUP_MAIN_SEARCH: (context) => SearchPage(),
    PageId.GROUP_MAIN_IMAGE_DISPLAY: (context) => ImageDisplayPage(),
    PageId.GROUP_MAIN_WEBVIEW_LOADING_PAGE: (context) => WebViewLoadingPage(),

    /// 聊天模块
    PageId.GROUP_CHAT_CHAT_PAGE: (context) => ChatPage(),
    PageId.GROUP_CHAT_SYSTEM_MESSAGE_PAGE: (context) => SystemMessagePage(),
    PageId.GROUP_CHAT_CHAT_SETTINGS_PAGE: (context) => ChatSettingsPage(),
    PageId.GROUP_CHAT_CHAT_BACKGROUND_SETTINGS_PAGE: (context) => ChatBackgroundSettings(),

    /// 联系人模块
    PageId.GROUP_CONTACTS_NEW_FRIENDS: (context) => NewFriendsPage(),
    PageId.GROUP_CONTACTS_STRANGER_VALIDATION: (context) => StrangerValidationPage(),
    PageId.GROUP_CONTACTS_REMARKS_SETTINGS: (context) => RemarksSettings(),
    PageId.GROUP_CONTACTS_FRIEND_PERMISSION_SETTINGS: (context) => FriendPermissionSettings(),
    PageId.GROUP_CONTACTS_USER_INFO: (context) => UserInfoPage(),
    PageId.GROUP_CONTACTS_PHONE_CONTACTS: (context) => PhoneContactsPage(),

    /// 我的模块
    PageId.GROUP_PERSONAL_SOCIAL_UPDATES: (context) => SocialUpdates(),
  };

  static Map<String, WidgetBuilder> get routers => _routers;
}