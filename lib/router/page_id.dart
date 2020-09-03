class PageId{
  /// -----------------------------分组start----------------------------
  /// 聊天模块
  static const String GROUP_CHAT = "/chat";

  /// 联系人模块
  static const String GROUP_CONTACTS = "/contacts";

  /// "我的"模块
  static const String GROUP_PERSONAL = "/personal";

  /// 主模块
  static const String GROUP_APP = "/app";
  /// -----------------------------分组end----------------------------


  /// ------------------------------聊天模块start---------------------------
  /// 聊天页面
  static const String GROUP_CHAT_CHAT_PAGE = GROUP_CHAT + "/chat_page";
  static const String GROUP_CHAT_SYSTEM_MESSAGE_PAGE = GROUP_CHAT + "/system_message_page";
  /// ------------------------------聊天模块end---------------------------


  /// ------------------------------联系人模块start---------------------------
  /// 新的朋友页面
  static const String GROUP_CONTACTS_NEW_FRIENDS = GROUP_CONTACTS + "/new_friends";
  /// 陌生人验证页面
  static const String GROUP_CONTACTS_STRANGER_VALIDATION = GROUP_CONTACTS + "/stranger_validation_page";
  /// 设置备注页面
  static const String GROUP_CONTACTS_REMARKS_SETTINGS = GROUP_CONTACTS + "/remarks_settings";
  /// 朋友权限设置页面
  static const String GROUP_CONTACTS_FRIEND_PERMISSION_SETTINGS = GROUP_CONTACTS + "/friend_permission_settings";
  /// 用户资料页面
  static const String GROUP_CONTACTS_USER_INFO = GROUP_CONTACTS + "/user_info";
  /// 手机通讯录页面
  static const String GROUP_CONTACTS_PHONE_CONTACTS = GROUP_CONTACTS + "/phone_contacts";
  /// ------------------------------联系人模块end---------------------------


  /// ------------------------------"我的"模块start---------------------------
  /// 好友动态页面
  static const String GROUP_PERSONAL_SOCIAL_UPDATES = GROUP_PERSONAL + "/social_updates";
  /// ------------------------------"我的"模块end---------------------------


  /// ------------------------------"主模块start---------------------------
  /// 主页面
  static const String GROUP_MAIN = GROUP_APP + "/app";
  /// 搜索页面
  static const String GROUP_MAIN_SEARCH = GROUP_APP + "/search";
  /// 展示图片页面
  static const String GROUP_MAIN_IMAGE_DISPLAY = GROUP_APP + "/image_display";
  static const String GROUP_MAIN_WEBVIEW_LOADING_PAGE = GROUP_APP + "/webview_loading_page";
  /// ------------------------------"主模块end---------------------------
}