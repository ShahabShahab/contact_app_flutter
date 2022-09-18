import 'package:flutter/material.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_provider.dart';
import 'package:parsianotp/widgets/custom_match_parent_button.dart';
import 'package:parsianotp/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ContactDetailPage extends StatelessWidget {
  ContactDetailPage({Key key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ContactDetailProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(
            label: provider.firstNameValidationError,
          ),
          CustomTextField(
            label: provider.lastNameValidationError,
          ),
          CustomTextField(
            label: provider.phoneNumberValidationError,
          ),
          CustomTextField(
            label: provider.emailValidationError,
          ),
          CustomTextField(
            label: provider.noteValidationError,
            maxLines: 5,
          ),
        ],
      ),
      bottomNavigationBar: CustomMatchParentButton(
        onPressed: () {
          provider.validateFields(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              phoneNumber: phoneNumberController.text,
              email: emailController.text,
              note: noteController.text);
        },
      ),
    );
  }
}
