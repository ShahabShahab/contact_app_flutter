import 'package:contactapp/data_source/local/local_data_source.dart';
import 'package:contactapp/injection_container.dart';
import 'package:contactapp/repos/base_repositoy.dart';

class LoginRepository implements BaseRepository {
  LocalDataSource localDataSource = sl<LocalDataSource>();

  Future login(String username, String password) async {
    await Future.delayed(Duration(seconds: 3));
    await localDataSource.setUserAlreadyLoggedIn();
  }

}
