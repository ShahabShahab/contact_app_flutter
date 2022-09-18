import 'package:flutter/foundation.dart';
import 'package:parsianotp/base_provider.dart';
import 'package:parsianotp/pages/contact_details_page/contact_validation_controller.dart';

class ContactDetailProvider extends BaseProvider {
  String firstNameValidationError = "";
  String lastNameValidationError = "";
  String phoneNumberValidationError = "";
  String emailValidationError = "";
  String noteValidationError = "";
  ContactValidationController _validationController =
      ContactValidationController();

  void validateFields(
      {String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String note}) {
    _validationController.validateText(
        text: firstName,
        contactValidateCallback: (error) {
          firstNameValidationError = error;
        });
    _validationController.validateText(
        text: lastName,
        contactValidateCallback: (error) {
          lastNameValidationError = error;
        });
    _validationController.validateText(
        text: note,
        contactValidateCallback: (error) {
          noteValidationError = error;
        });
    _validateEmail(email);
    _validatePhoneNumber(phoneNumber);
    notifyListeners();
  }

  void _validateEmail(String email) {
    _validationController.validateEmail(
        email: email,
        contactValidateCallback: (error) {
          emailValidationError = error;
        });
  }

  void _validatePhoneNumber(String phoneNumber) {
    _validationController.validatePhoneNumber(
        phoneNumber: phoneNumber,
        contactValidateCallback: (error) {
          phoneNumberValidationError = error;
        });
  }

  void _validateText(String text, String fieldError) {
    _validationController.validateText(
        text: text,
        contactValidateCallback: (error) {
          fieldError = error;
        });
  }
}
