import 'package:flutter/material.dart';
import 'package:contactapp/models/contact.dart';
import 'package:contactapp/pages/contact_details_page/contact_detail_page.dart';
import 'package:contactapp/pages/contact_details_page/contact_detail_provider.dart';
import 'package:contactapp/pages/contact_list/contact_list_provider.dart';
import 'package:contactapp/utils/ui_utils.dart';
import 'package:contactapp/widgets/contact_row.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatelessWidget {
  ContactListPage({Key? key}) : super(key: key);
  late ContactListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ContactListProvider>(context, listen: false);
    return FutureBuilder(
        future: _getContact(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return buildLoading();
          } else if (data.hasError) {
            return buildTryAgainWidget(
                error: "Something Went wrong",
                onTryAgainClicked: () => _getContact());
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: _buildContactList(data.data as List<Contact>),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _openContactDetailPage(context);
                },
                child: const Text("Add"),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            );
          }
        });
  }

  Future<void> _getContact() => provider.getContacts();

  Widget _buildContactList(List<Contact> contacts) {
    if (_contactsListIsEmpty(contacts)) {
      return const Scaffold(
        body: Center(
          child: Text("Not Contacts found"),
        ),
      );
    } else {
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
                  child: _buildContactRow(contacts, index),
                ),
                buildMargin(height: 10)
              ],
            );
          },
          itemCount: contacts.length,
        ),
      );
    }
  }

  ContactRow _buildContactRow(List<Contact> contacts, int index) {
    try {
      return ContactRow(
        name: contacts[index].firstName!,
        phoneNumber: contacts[index].phone!,
        picture: contacts[index].picture![0],
      );
    } catch (e) {
      return ContactRow(
        name: contacts[index].firstName!,
        phoneNumber: contacts[index].phone!,
        picture: "Picture",
      );
    }
  }

  bool _contactsListIsEmpty(List<Contact> contacts) => contacts.length == 0;

  _openContactDetailPage(BuildContext context, {Contact? contact}) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => ContactDetailProvider(),
                  child: ContactDetailPage(contact: contact),
                ))).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (context) => ContactListProvider(),
                    child: ContactListPage(),
                  )));
    });
  }
}
