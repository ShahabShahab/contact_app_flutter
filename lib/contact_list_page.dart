import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'contact.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildListView(),
    );
  }

  ListView _buildListView() {
    final contactsBox = Hive.box('contacts');
    return ListView.builder(
      itemCount: contactsBox.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = contactsBox.get(index) as Contact;

        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.age.toString()),
        );
      },
    );
  }
}
