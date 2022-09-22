import 'package:contactapp/data_source/local/local_data_source.dart';
import 'package:contactapp/injection_container.dart';
import 'package:contactapp/utils/base_provider.dart';

class SplashProvider extends BaseProvider{

  LocalDataSource localDataSource = sl<LocalDataSource>();

  Future<bool> hasUserAlreadyLoggedIn() async {
    return await localDataSource.getUserAlreadyLoggedIn();
  }

}