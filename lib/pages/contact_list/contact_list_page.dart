import 'package:flutter/material.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_page.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_provider.dart';
import 'package:parsianotp/pages/contact_list/contact_list_provider.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContactListProvider>(context, listen: false);
    return FutureBuilder(
        future: provider.getContacts(),
        builder: (context, data) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(provider.errorMessage),
            ),
            bottomNavigationBar: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                              create: (context) => ContactDetailProvider(),
                              child: ContactDetailPage(),
                            )));
              },
              child: Text("data"),
            ),
          );
        });
  }
}
