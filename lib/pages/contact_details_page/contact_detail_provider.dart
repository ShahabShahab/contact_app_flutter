import 'package:parsianotp/base_provider.dart';
import 'package:parsianotp/pages/contact_details_page/contact_validation_controller.dart';
import 'package:parsianotp/utils.dart';

class ContactDetailProvider extends BaseProvider {
  String firstNameValidationError = "";
  String lastNameValidationError = "";
  String phoneNumberValidationError = "";
  String emailValidationError = "";
  String noteValidationError = "";
  ContactValidationController _validationController =
      ContactValidationController();
  bool _globalContactDetailValidationFlag = true;

  bool areContactDetailInputValid(
      {String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String note}) {
    _validationController.validateText(
        text: firstName,
        contactValidateCallback: (error) {
          firstNameValidationError = error;
          _resetGlobalValidationFlag(error);
        });
    _validationController.validateText(
        text: lastName,
        contactValidateCallback: (error) {
          lastNameValidationError = error;
          _resetGlobalValidationFlag(error);
        });
    _validationController.validateText(
        text: note,
        contactValidateCallback: (error) {
          noteValidationError = error;
          _resetGlobalValidationFlag(error);
        });
    _validateEmail(email);
    _validatePhoneNumber(phoneNumber);
    notifyListeners();
    return _globalContactDetailValidationFlag;
  }

  _resetGlobalValidationFlag(String error) {
    if (isStringValid(error)) {
      _globalContactDetailValidationFlag = false;
    } else {
      _globalContactDetailValidationFlag = true;
    }
  }

  void _validateEmail(String email) {
    _validationController.validateEmail(
        email: email,
        contactValidateCallback: (error) {
          emailValidationError = error;
          _resetGlobalValidationFlag(error);
        });
  }

  void _validatePhoneNumber(String phoneNumber) {
    _validationController.validatePhoneNumber(
        phoneNumber: phoneNumber,
        contactValidateCallback: (error) {
          phoneNumberValidationError = error;
          _resetGlobalValidationFlag(error);
        });
  }

  void checkFirstNameValidationError(String firstName) {
    if (firstName.length > 0) {
      firstNameValidationError = "";
      notifyListeners();
    }
  }

  void checkLastNameValidationError(String lastName) {
    if (lastName.length > 0) {
      lastNameValidationError = "";
      notifyListeners();
    }
  }

  void checkPhoneNumberValidationError(String phoneNumber) {
    if (phoneNumber.length > 0) {
      phoneNumberValidationError = "";
      notifyListeners();
    }
  }

  void checkEmailValidationError(String email) {
    if (email.length > 0) {
      emailValidationError = "";
      notifyListeners();
    }
  }

  void checkNoteValidationError(String note) {
    if (note.length > 0) {
      noteValidationError = "";
      notifyListeners();
    }
  }
}
