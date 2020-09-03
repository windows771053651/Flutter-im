import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/common/app_bar.dart';
import 'package:flutter_im/contacts/bean/contact_bean.dart';
import 'package:flutter_im/contacts/sub_view/phone_contact_item.dart';
import 'package:flutter_im/router/page_id.dart';
import 'package:flutter_im/utils/im_tools.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneContactsPage extends StatefulWidget {
  @override
  State createState() => PhoneContactsState();
}

class PhoneContactsState extends State<PhoneContactsPage> {

  final EasyContactPicker _contactPicker = new EasyContactPicker();

  List<Contact> _list = new List();

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  void _requestPermission() async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);

    // 申请结果
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);

    if (permission == PermissionStatus.granted){
      _getContactData();
    }
  }

  void _getContactData() async {
    List<Contact> list = await _contactPicker.selectContacts();
    if (_list == null || _list.length == 0) {
      showToast("未读取到联系人列表");
    } else {
      setState(() {
        _list = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context,
        leftTitle: "查看手机通讯录",
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return PhoneContactItem(
            contact: _list[index],
            callback: () {
              ContactVO contactVo = ContactVO(
                name: "古力娜扎",
                avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598891453746&di=e54fdb6d8cefa644ea1263e540ebb180&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn16%2F720%2Fw1920h1200%2F20181117%2Fe377-hnyuqhh4897269.jpg",
                serialNum: "zhazha",
              );
              Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_USER_INFO, arguments: contactVo);
            },
          );
        },
      ),
    );
  }
}