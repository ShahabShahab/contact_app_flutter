import 'package:dio/dio.dart';
import 'package:contactapp/data_source/data_source.dart';
import 'package:contactapp/data_source/remote/rest_client.dart';

class RemoteDataSource implements DataSource {
   final RestClient restClient;

  RemoteDataSource({required this.restClient});

}
