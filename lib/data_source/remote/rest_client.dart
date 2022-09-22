import 'package:dio/dio.dart';
import 'package:contactapp/models/contact.dart';
import 'package:contactapp/models/get_contacts_response.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/contacts")
  Future<GetContactsResponse> getContacts();

  @GET("/contacts/{id}")
  Future<GetContactsResponse> getContactWithId(@Path() String id);

  @POST("/contacts")
  Future<GetContactsResponse> addContact(@Body() Contact contact);

  @DELETE("/contacts/{id}")
  Future<void> deleteContact(@Path() String id);

  @POST("/contacts/{id}")
  Future<GetContactsResponse> editContact(@Path() String id,);
}
