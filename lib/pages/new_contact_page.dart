import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:parsianotp/constants/hive_constants.dart';
import 'package:parsianotp/entities/contact.dart';
import 'package:parsianotp/pages/contact_list_page.dart';

class NewContactPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  NewContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
      bottomNavigationBar: ElevatedButton(
        onPressed: () async {
          _insertNewContact();
        },
        child: const Text("Insert New Contact"),
      ),
    );
  }

  Future<void> _insertNewContact() async {
    final contactsBox = Hive.box<Contact>(CONTACTS_BOX_NAME);
    Contact contact =
        Contact(_nameController.text, int.parse(_ageController.text));
    await contactsBox.add(contact);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: "Contact Name"),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: _ageController,
          decoration: const InputDecoration(hintText: "Contact Age"),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ContactsListPage();
              }));
            },
            child: const Text('Contacts List Page'))
      ],
    );
  }
}
