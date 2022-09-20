import 'package:flutter/material.dart';
import 'package:parsianotp/models/contact.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_page.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_provider.dart';
import 'package:parsianotp/pages/contact_list/contact_list_provider.dart';
import 'package:parsianotp/ui_utils.dart';
import 'package:parsianotp/widgets/contact_row.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({Key key}) : super(key: key);
  ContactListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ContactListProvider>(context, listen: false);
    return FutureBuilder(
        future: provider.getContacts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return buildLoading();
          } else if (data.hasError) {
            return buildTryAgainWidget(
                error: "Something Went wrong",
                onTryAgainClicked: () => _getContact());
          } else
            return Scaffold(
              appBar: AppBar(),
              body: _buildContactList(data.data),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _openContactDetailPage(context);
                },
                child: Container(child: Text("Add")),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            );
        });
  }

  Future<void> _getContact() => provider.getContacts();

  Widget _buildContactList(List<Contact> contacts) {
    if (_contactsListIsEmpty(contacts)) {
      return Scaffold(
        body: Center(
          child: Text("Not Contacts found"),
        ),
      );
    } else
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _openContactDetailPage(context, contact: contacts[index]);
                  },
                  child: ContactRow(
                    name: contacts[index].firstName,
                    phoneNumber: contacts[index].phone,
                    picture: contacts[index].picture[0],
                  ),
                ),
                buildMargin(height: 10)
              ],
            );
          },
          itemCount: contacts.length,
        ),
      );
  }

  bool _contactsListIsEmpty(List<Contact> contacts) => contacts.length == 0;

  _openContactDetailPage(BuildContext context, {Contact contact}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => ContactDetailProvider(),
                  child: ContactDetailPage(contact: contact),
                )));
  }
}
