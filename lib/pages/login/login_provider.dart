import 'package:contactapp/injection_container.dart';
import 'package:contactapp/repos/login_repository.dart';
import 'package:contactapp/utils/base_provider.dart';
import 'package:contactapp/utils/validation_controller.dart';

class LoginProvider extends BaseProvider {
   String? userNameValidationError;
   String? passwordValidationError;
  final ValidationController _controller = ValidationController();
  LoginRepository repository = sl<LoginRepository>();

  void checkForUserNameTyping(String userName) {
    if (userName.isNotEmpty) {
      userNameValidationError = "";
      notifyListeners();
    }
  }

  void checkForPasswordTyping(String password) {
    if (password.isNotEmpty) {
      passwordValidationError = "";
      notifyListeners();
    }
  }

  bool areLoginInputsValid(String email, String password) {
    bool isEmailValid = true;
    bool isPasswordValid = true;
    _controller.validateEmail(
        email: email,
        validationCallback: (msg) {
          if (msg == null) {
            isEmailValid = true;
          } else {
            userNameValidationError = msg;
            isEmailValid = false;
          }
        });
    _controller.validatePassword(
        password: password,
        validationCallback: (msg) {
          if (msg == null) {
            isPasswordValid = true;
          } else {
            isPasswordValid = false;
            passwordValidationError = msg;
          }
        });
    notifyListeners();
    return isEmailValid && isPasswordValid;
  }

  Future login(String username, String password,
      {required Function() onSuccess, required Function() onError}) async {
    setState(ViewState.LOADING);
    repository.login(username, password);
    onSuccess();
    setState(ViewState.IDLE);
  }
}
