import 'package:dio/dio.dart';
import 'package:parsianotp/models/posts_response.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/posts")
  Future<List<PostsResponse>> getPosts();
}
