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
      ..options.baseUrl = "https://api.restpoint.io/api/"
      ..options.connectTimeout = 10000
      ..options.receiveTimeout = 10000
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (Options options) async {
        options.headers.putIfAbsent(
            'x-endpoint-key', () => "38444aae02c84851969f93e5d0e6eb37");
      }));
  }
}
