import 'package:flutter/material.dart';
import 'package:parsianotp/pages/contact_list/contact_list_provider.dart';
import 'package:parsianotp/widgets/custom_match_parent_button.dart';
import 'package:parsianotp/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContactListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(
            label: "FirstName",
          ),
          CustomTextField(
            label: "LastName",
          ),
          CustomTextField(
            label: "PhoneNumber",
          ),
          CustomTextField(
            label: "Email",
          ),
          CustomTextField(
            label: "Note",
            maxLines: 5,
          ),
        ],
      ),
      bottomNavigationBar: CustomMatchParentButton(
        onPressed: () {

        },
      ),
    );
  }
}
