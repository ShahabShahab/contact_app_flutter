import 'package:dio/dio.dart';
import 'package:parsianotp/data_source/remote/rest_client.dart';

class RemoteDataSource {
  final RestClient restClient;

  RemoteDataSource({this.restClient});

  Future<Response> getPosts() async{
    return null;
  }

}
