import 'package:flutter/material.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_page.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_provider.dart';
import 'package:parsianotp/pages/contact_list/contact_list_provider.dart';
import 'package:parsianotp/ui_utils.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatelessWidget {
   ContactListPage({Key key}) : super(key: key);
  ContactListProvider provider ;

  @override
  Widget build(BuildContext context) {
    provider= Provider.of<ContactListProvider>(context, listen: false);
    return FutureBuilder(
        future: provider.getContacts(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return buildLoading();
          } else if (data.hasError) {
            return buildTryAgainWidget(error: "Something Went wrong",
            onTryAgainClicked: () => _getContact());
          } else
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

  Future<void> _getContact() => provider.getContacts();
}
