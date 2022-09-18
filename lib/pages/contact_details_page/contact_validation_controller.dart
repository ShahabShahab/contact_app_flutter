import 'package:flutter/foundation.dart';
import 'package:parsianotp/utils.dart';

typedef ContactValidateCallback = Function(String errorValidateMsg);

class ContactValidationController {
  void validateText(
      {@required String text,
      @required ContactValidateCallback contactValidateCallback}) {
    if (!isStringValid(text)) {
      contactValidateCallback("Field must be at least 3 characters");
    }
  }

  void validateEmail(
      {@required String email,
      @required ContactValidateCallback contactValidateCallback}) {
    if (!isStringValid(email)) {
      contactValidateCallback("Email must be filled.");
    } else if (!isEmailValid(email)) {
      contactValidateCallback("Email format is not correct");
    }
  }

  void validatePhoneNumber(
      {@required String phoneNumber,
      @required ContactValidateCallback contactValidateCallback}) {
    if (!isStringValid(phoneNumber)) {
      contactValidateCallback("PhoneNumber must be filled.");
    } else if (!isTelephoneNumberValid(phoneNumber)) {
      contactValidateCallback("PhoneNumber format is not correct");
    }
  }
}
