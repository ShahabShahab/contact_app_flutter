import 'package:parsianotp/base_provider.dart';
import 'package:parsianotp/injection_container.dart';
import 'package:parsianotp/models/contact.dart';
import 'package:parsianotp/pages/contact_details_page/contact_validation_controller.dart';
import 'package:parsianotp/repos/contacts_repository.dart';

class ContactDetailProvider extends BaseProvider {
  String firstNameValidationError = "";
  String lastNameValidationError = "";
  String phoneNumberValidationError = "";
  String emailValidationError = "";
  String noteValidationError = "";
  ContactValidationController _validationController =
      ContactValidationController();
  Contact contact;
  ContactsRepository repository = sl<ContactsRepository>();

  bool areContactDetailInputValid(
      {String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String note}) {
    _validateFirstName(firstName);
    _validateLastName(lastName);
    _validateEmail(email);
    _validatePhoneNumber(phoneNumber);
    _validateNote(note);
    notifyListeners();
    return _checkValidationFlags();
  }

  void _validateNote(String note) {
    _validationController.validateText(
        text: note,
        contactValidateCallback: (error) {
          noteValidationError = error;
        });
  }

  void _validateLastName(String lastName) {
    _validationController.validateText(
        text: lastName,
        contactValidateCallback: (error) {
          lastNameValidationError = error;
        });
  }

  void _validateFirstName(String firstName) {
    _validationController.validateText(
        text: firstName,
        contactValidateCallback: (error) {
          firstNameValidationError = error;
        });
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

  Future<void> operateOnContact(
      {String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String note,
      Null Function() onSuccess,
      Null Function() onError,
      bool edit}) async {
    setState(ViewState.LOADING);
    var response;
    response = await repository.operateOnContact(
        Contact(
            firstName: firstName,
            lastName: lastName,
            phone: phoneNumber,
            email: email,
            notes: note),
        edit: edit);
    if (response.ok) {
      onSuccess();
      setState(ViewState.IDLE);
    } else {
      error = "Something went wrong!";
      setState(ViewState.ERROR);
    }
  }

  bool _checkValidationFlags() =>
      firstNameValidationError == null &&
      lastNameValidationError == null &&
      noteValidationError == null &&
      phoneNumberValidationError == null &&
      emailValidationError == null;

  Future<void> deleteContact(String id,
      {Null Function() onSuccess, Null Function() onError}) async {
    setState(ViewState.LOADING);
    try {
      var response = await repository.deleteContact(contactId: id);
      if (response.ok) {
        onSuccess();
        setState(ViewState.IDLE);
      } else {
        error = response.error.message;
        setState(ViewState.ERROR);
        onError();
      }
    } catch (e) {
      error = "somethig went wrong";
      setState(ViewState.ERROR);
      onError();
    }
  }
}
