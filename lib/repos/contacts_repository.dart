import 'package:dio/dio.dart';
import 'package:parsianotp/data_source/remote/rest_client.dart';
import 'package:parsianotp/injection_container.dart';
import 'package:parsianotp/models/contact.dart';
import 'package:parsianotp/models/response_wrapper.dart';
import 'package:parsianotp/repos/base_repositoy.dart';

class ContactsRepository implements BaseRepository {
  RestClient restClient = sl<RestClient>();

  Future<DomesticResponseWrapper<List<Contact>>> getContacts() async {
    try {
      var response = await restClient.getContacts();
      return DomesticResponseWrapper.builder(true, null, response.data);
    } on DioError catch (error) {
      return DomesticResponseWrapper.fromDioError(error: error);
    } catch (e, s) {
      return DomesticResponseWrapper.fromError(e, s);
    }
  }
}
