import 'package:hive/hive.dart';
import 'package:parsianotp/constants/hive_constants.dart';
import 'package:parsianotp/data_source/data_source.dart';

class LocalDataSource implements DataSource {
  Box<bool> loginBox;

  LocalDataSource() {
    loginBox = Hive.box(HAS_USER_ALREADY_LOGGED_IN);
  }

  Future<void> setUserAlreadyLoggedIn() async {
    await loginBox.put(HAS_USER_ALREADY_LOGGED_IN, true);
  }

  Future<bool> getUserAlreadyLoggedIn() async {
    return await loginBox.get(HAS_USER_ALREADY_LOGGED_IN, defaultValue: false);
  }
}
