import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parsianotp/pages/contact_details_page/contact_detail_provider.dart';
import 'package:parsianotp/ui_utils.dart';
import 'package:parsianotp/widgets/custom_match_parent_button.dart';
import 'package:parsianotp/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ContactDetailPage extends StatelessWidget {
  ContactDetailPage({Key key}) : super(key: key);

  final TextEditingController firstNameController =
      TextEditingController(text: "shahab");
  final TextEditingController lastNameController =
      TextEditingController(text: "sdfhdfs");
  final TextEditingController phoneNumberController =
      TextEditingController(text: "09383181063");
  final TextEditingController emailController =
      TextEditingController(text: "s@s.c");
  final TextEditingController noteController =
      TextEditingController(text: "sdfjfdks");
  ContactDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ContactDetailProvider>(context);
    if (provider.isLoading) {
      return Scaffold(
        body: Center(
            child: Container(
          child: Lottie.asset('assets/loading.json'),
          height: 200,
          width: 200,
        )),
      );
    } else {
      return Scaffold(
          appBar: AppBar(),
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
          bottomNavigationBar: CustomMatchParentButton(onPressed: () {
            bool validationResult = provider.areContactDetailInputValid(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                phoneNumber: phoneNumberController.text,
                email: emailController.text,
                note: noteController.text);
            if (validationResult) {
              _submitContact(context);
            }
          }));
    }
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
}
