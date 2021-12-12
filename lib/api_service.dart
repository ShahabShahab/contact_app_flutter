import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
        // The first part of the URL is now here
        baseUrl: 'https://jsonplaceholder.typicode.com',
        services: [
          // The generated implementation
          _$ApiService(),
        ],
        // Converts data to & from JSON and adds the application/json header.
        converter: const JsonConverter(),
        interceptors: [
          const HeadersInterceptor({'Cache-Control': 'no-cache'}),
           HttpLoggingInterceptor(),
          (Request request) async {
            chopperLogger.info('Performed a request');
            return request;
          },
          (Response response) async {
            if (response.statusCode == 404) {
              chopperLogger.severe('404 NOT FOUND');
            }
            return response;
          },
        ]);

    // The generated class with the ChopperClient passed in
    return _$ApiService(client);
  }

  @override
  Type get definitionType => throw UnimplementedError();

  @Get(path: "/posts")
  Future<Response> getPosts();

  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);

  @Post(path: "/post")
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );
}
