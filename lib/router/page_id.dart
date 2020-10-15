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
  /// 系统消息页面
  static const String GROUP_CHAT_SYSTEM_MESSAGE_PAGE = GROUP_CHAT + "/system_message_page";
  /// 聊天设置页面
  static const String GROUP_CHAT_CHAT_SETTINGS_PAGE = GROUP_CHAT + "/chat_settings_page";
  /// 聊天背景设置页面
  static const String GROUP_CHAT_CHAT_BACKGROUND_SETTINGS_PAGE = GROUP_CHAT + "/chat_background_settings_page";
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
  static const String GROUP_PERSONAL_FRIENDS_UPDATES = GROUP_PERSONAL + "/friends_updates";
  /// 发布好友动态页面
  static const String GROUP_PERSONAL_PUBLISH_FRIENDS_UPDATES = GROUP_PERSONAL + "/publish_friends_updates";
  /// 搜索页面
  static const String GROUP_PERSONAL_SEARCH = GROUP_PERSONAL + "/search";
  /// 展示图片页面
  static const String GROUP_PERSONAL_MULTI_IMAGE_DISPLAY = GROUP_PERSONAL + "/image_display";
  /// web页面
  static const String GROUP_PERSONAL_WEBVIEW_LOADING_PAGE = GROUP_PERSONAL + "/webview_loading_page";
  /// 个人信息页面
  static const String GROUP_PERSONAL_PERSONAL_INFO = GROUP_PERSONAL + "/personal_info";
  /// 二维码名片页面
  static const String GROUP_PERSONAL_QR_CODE_BUSINESS_CARD = GROUP_PERSONAL + "/qr_code_business_card";
  /// 相册
  static const String GROUP_PERSONAL_GALLERY_PAGE = GROUP_PERSONAL + "/gallery_page";
  /// 我的文件
  static const String GROUP_PERSONAL_MY_FILE_PAGE = GROUP_PERSONAL + "/my_file_page";
  /// 客服中心
  static const String GROUP_PERSONAL_CUSTOM_SERVICE_PAGE = GROUP_PERSONAL + "/custom_service_page";
  /// 视频播放
  static const String GROUP_PERSONAL_AUDIO_PLAYING_PAGE = GROUP_PERSONAL + "/audio_playing";
  /// ------------------------------"我的"模块end---------------------------


  /// ------------------------------"主模块start---------------------------
  /// 主页面
  static const String GROUP_MAIN = GROUP_APP + "/app";
  /// ------------------------------"主模块end---------------------------
}