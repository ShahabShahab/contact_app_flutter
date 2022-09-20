import 'package:parsianotp/base_provider.dart';
import 'package:parsianotp/injection_container.dart';
import 'package:parsianotp/repos/login_repository.dart';

class LoginProvider extends BaseProvider {
  String userNameValidationError;
  String passwordValidationError;
  LoginRepository repository = sl<LoginRepository>();

  void checkForUserNameTyping(String userName) {
    if (userName.length > 0) {
      userNameValidationError = "";
      notifyListeners();
    }
  }

  void checkForPasswordTyping(String password) {
    if (password.length > 0) {
      passwordValidationError = "";
      notifyListeners();
    }
  }

  Future login(String username, String password,
      {Function() onSuccess, Function() onError}) async {
    await Future.delayed(Duration(seconds: 3));
    repository.login(username, password);
  }
}
