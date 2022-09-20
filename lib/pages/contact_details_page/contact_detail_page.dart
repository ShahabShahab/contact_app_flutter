import 'package:flutter/material.dart';
import 'package:parsianotp/models/contact.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_provider.dart';
import 'package:parsianotp/ui_utils.dart';
import 'package:parsianotp/widgets/custom_match_parent_button.dart';
import 'package:parsianotp/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ContactDetailPage extends StatelessWidget {
  ContactDetailPage({Key key, this.contact}) : super(key: key){
    firstNameController.text = contact.firstName;
    lastNameController.text = contact.lastName;
    phoneNumberController.text = contact.phone;
    emailController.text = contact.email;
    noteController.text = contact.notes;
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  ContactDetailProvider provider;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ContactDetailProvider>(context);
    if (provider.isLoading) {
      return buildLoading();
    } else {
      return Scaffold(
          appBar: AppBar(actions: [_buildDeleteIcon(context)]),
          body: Column(
            children: [
              CustomTextField(
                label: "First Name",
                error: provider.firstNameValidationError,
                onChanged: (value) {
                  provider.checkFirstNameValidationError(value);
                },
                controller: firstNameController,
              ),
              CustomTextField(
                label: "Last Name",
                error: provider.lastNameValidationError,
                onChanged: (value) {
                  provider.checkLastNameValidationError(value);
                },
                controller: lastNameController,
              ),
              CustomTextField(
                label: "Phone Number",
                error: provider.phoneNumberValidationError,
                onChanged: (value) {
                  provider.checkPhoneNumberValidationError(value);
                },
                controller: phoneNumberController,
              ),
              CustomTextField(
                label: "Email",
                error: provider.emailValidationError,
                onChanged: (value) {
                  provider.checkEmailValidationError(value);
                },
                controller: emailController,
              ),
              CustomTextField(
                label: "Note",
                error: provider.noteValidationError,
                maxLines: 5,
                onChanged: (value) {
                  provider.checkNoteValidationError(value);
                },
                controller: noteController,
              ),
            ],
          ),
          bottomNavigationBar: CustomMatchParentButton(
              onPressed: () {
                bool validationResult = provider.areContactDetailInputValid(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phoneNumber: phoneNumberController.text,
                    email: emailController.text,
                    note: noteController.text);
                if (validationResult) {
                  _submitContact(context);
                }
              },
              title: _getTitle()));
    }
  }

  Widget _buildDeleteIcon(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 50,
        child: Icon(Icons.delete),
      ),
      onTap: () => _onDeleteContact(context),
    );
  }

  void _submitContact(BuildContext context) {
    provider.submitNewContact(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
        note: noteController.text,
        onSuccess: () {
          Navigator.pop(context);
        },
        onError: () {
          showSnackBar(context, provider.error);
        });
  }

  void _onDeleteContact(BuildContext context) {
    provider.deleteContact(onSuccess: () {
      showSnackBar(context, "Successfully Deleted");
      Navigator.pop(context);
      Navigator.pop(context);
    }, onError: () {
      showSnackBar(context, provider.error);
    });
  }

  String _getTitle() =>
      this.contact == null ? "Submit Contact" : "Edit Contact";
}
