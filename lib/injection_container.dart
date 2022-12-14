import 'package:get_it/get_it.dart';
import 'package:contactapp/data_source/local/local_data_source.dart';
import 'package:contactapp/data_source/remote/network_module.dart';
import 'package:contactapp/data_source/remote/remote_data_source.dart';
import 'package:contactapp/data_source/remote/rest_client.dart';
import 'package:contactapp/repos/contacts_repository.dart';
import 'package:contactapp/repos/login_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => RestClient(NetworkModule.instance.getDio()));

  sl.registerLazySingleton(() => RemoteDataSource(restClient: sl()));

  sl.registerLazySingleton(() => LocalDataSource());

  sl.registerFactory(() => LoginRepository());

  sl.registerLazySingleton(() => ContactsRepository());

}
