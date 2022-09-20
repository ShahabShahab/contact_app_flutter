bool isStringValid(String input) {
  return input != null && input.isNotEmpty;
}

bool isEmailValid(String email) {
  if (email == null || email.isEmpty) {
    return false;
  }
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isTelephoneNumberValid(String value) {
  String pattern = r'^(0)?[0-9]{10}$';
  RegExp regExp = new RegExp(pattern);
  if (value.length != 11) {
    return false;
  } else if (regExp.hasMatch(value)) {
    return true;
  }
  return false;
}

void checkForTyping(String value) {}