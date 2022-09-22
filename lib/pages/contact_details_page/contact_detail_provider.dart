import 'package:contactapp/utils/base_provider.dart';
import 'package:contactapp/injection_container.dart';
import 'package:contactapp/models/contact.dart';
import 'package:contactapp/utils/validation_controller.dart';
import 'package:contactapp/repos/contacts_repository.dart';

class ContactDetailProvider extends BaseProvider {
  String? firstNameValidationError = "";
  String? lastNameValidationError = "";
  String? phoneNumberValidationError = "";
  String? emailValidationError = "";
  String? noteValidationError = "";
  final ValidationController _validationController =
      ValidationController();
  Contact? contact;
  ContactsRepository repository = sl<ContactsRepository>();

  bool areContactDetailInputValid(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String email,
      required String note}) {
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
        validationCallback: (error) {
          noteValidationError = error;
        });
  }

  void _validateLastName(String lastName) {
    _validationController.validateText(
        text: lastName,
        validationCallback: (error) {
          lastNameValidationError = error;
        });
  }

  void _validateFirstName(String firstName) {
    _validationController.validateText(
        text: firstName,
        validationCallback: (error) {
          firstNameValidationError = error;
        });
  }

  void _validateEmail(String email) {
    _validationController.validateEmail(
        email: email,
        validationCallback: (error) {
          emailValidationError = error;
        });
  }

  void _validatePhoneNumber(String phoneNumber) {
    _validationController.validatePhoneNumber(
        phoneNumber: phoneNumber,
        validationCallback: (error) {
          phoneNumberValidationError = error;
        });
  }

  void checkFirstNameValidationError(String firstName) {
    if (firstName.isNotEmpty) {
      firstNameValidationError = "";
      notifyListeners();
    }
  }

  void checkLastNameValidationError(String lastName) {
    if (lastName.isNotEmpty) {
      lastNameValidationError = "";
      notifyListeners();
    }
  }

  void checkPhoneNumberValidationError(String phoneNumber) {
    if (phoneNumber.isNotEmpty) {
      phoneNumberValidationError = "";
      notifyListeners();
    }
  }

  void checkEmailValidationError(String email) {
    if (email.isNotEmpty) {
      emailValidationError = "";
      notifyListeners();
    }
  }

  void checkNoteValidationError(String note) {
    if (note.isNotEmpty) {
      noteValidationError = "";
      notifyListeners();
    }
  }

  Future<void> operateOnContact(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String email,
      required String note,
      required Null Function() onSuccess,
      required Null Function() onError,
      required bool edit}) async {
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
      {required Null Function() onSuccess, required Null Function() onError}) async {
    setState(ViewState.LOADING);
    try {
      var response = await repository.deleteContact(contactId: id);
      if (response.ok) {
        onSuccess();
        setState(ViewState.IDLE);
      } else {
        error = response.error?.message;
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
