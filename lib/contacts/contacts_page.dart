import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/contacts/bean/contact_bean.dart';
import 'package:flutter_im/contacts/sub_view/contact_header.dart';
import 'package:flutter_im/contacts/sub_view/contact_item.dart';
import 'package:flutter_im/router/page_id.dart';

class ContactsPage extends StatelessWidget {

  List<ContactVO> dataResource = getContactData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataResource.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              _isShowHeaderView(index),
              ContactItem(
                index: index,
                controller: (index) {
                  return dataResource[index];
                },
                contactVO: dataResource[index],
                callback: () {
                  Navigator.of(context).pushNamed(PageId.GROUP_CONTACTS_USER_INFO, arguments: dataResource[index]);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _isShowHeaderView(int index) {
    if (index == 0) {
      return ContactHeader();
    }
    return Container();
  }
}
