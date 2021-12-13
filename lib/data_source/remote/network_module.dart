import 'package:dio/dio.dart';

class NetworkModule {
  NetworkModule._();

  static final NetworkModule instance = NetworkModule._();

  Dio dioOptions() {
    return Dio()
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};
  }

  Dio getDio() {
    return dioOptions()
      ..options.baseUrl = "https://jsonplaceholder.typicode.com"
      ..options.connectTimeout = 10000
      ..options.receiveTimeout = 10000
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
  }
}
