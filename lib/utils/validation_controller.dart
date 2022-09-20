import 'package:flutter/foundation.dart';
import 'package:parsianotp/utils/utils.dart';

typedef ValidationCallback = Function(String errorValidateMsg);

class ValidationController {
  void validateText(
      {@required String text,
      @required ValidationCallback validationCallback}) {
    if (!isStringValid(text)) {
      validationCallback("Field must be at least 3 characters");
    } else {
      validationCallback(null);
    }
  }

  void validateEmail(
      {@required String email,
      @required ValidationCallback validationCallback}) {
    if (!isStringValid(email)) {
      validationCallback("Email must be filled.");
    } else if (!isEmailValid(email)) {
      validationCallback("Email format is not correct");
    } else {
      validationCallback(null);
    }
  }

  void validatePhoneNumber(
      {@required String phoneNumber,
      @required ValidationCallback validationCallback}) {
    if (!isStringValid(phoneNumber)) {
      validationCallback("PhoneNumber must be filled.");
    } else if (!isTelephoneNumberValid(phoneNumber)) {
      validationCallback("PhoneNumber format is not correct");
    } else {
      validationCallback(null);
    }
  }

  void validatePassword(
      {@required String password,
      @required ValidationCallback validationCallback}) {
    if (password.length < 6) {
      validationCallback("Password Length must be at least 6 character");
    } else {
      validationCallback(null);
    }
  }
}
