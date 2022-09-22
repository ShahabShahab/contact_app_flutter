import 'package:dio/dio.dart';
import 'package:parsianotp/data_source/remote/rest_client.dart';
import 'package:parsianotp/injection_container.dart';
import 'package:parsianotp/models/contact.dart';
import 'package:parsianotp/models/get_contacts_response.dart';
import 'package:parsianotp/models/response_wrapper.dart';
import 'package:parsianotp/repos/base_repositoy.dart';

class ContactsRepository implements BaseRepository {
  RestClient restClient = sl<RestClient>();

  Future<ResponseWrapper<GetContactsResponse>> getContacts() async {
    try {
      var response = await restClient.getContacts();
      // var stringResponse =
      //     "{\"_links\":[{\"rel\":\"self\",\"href\":\"https:\/\/api.restpoint.io\/contacts\"},{\"rel\":\"items\",\"href\":\"https:\/\/api.restpoint.io\/contacts\/{id}\"}],\"count\":\"3\",\"data\":[{\"id\":\"1\",\"firstName\":\"John\",\"notes\":\"Very polite guy\",\"phone\":\"+123456789\",\"email\":\"email@email.de\",\"picture\":[\"noimg.png\"],\"lastName\":\"Doe\",\"created_at\":\"2022-09-19T12:53:32.224Z\"},{\"id\":\"3259b2a2-3bfb-48af-ba26-b1ac8845388a\",\"firstName\":\"Vall\",\"notes\":\"Very very\",\"phone\":\"+987654321\",\"email\":\"string@email.co\",\"picture\":[\"string\"],\"lastName\":\"Evv\",\"created_at\":\"2022-09-19T13:09:31.228Z\"},{\"id\":\"f2068a89-219c-46a3-ae09-c91177fa3316\",\"firstName\":\"Lorenzo\",\"notes\":\"Very very\",\"phone\":\"+11987654321\",\"email\":\"string@email.be\",\"picture\":[\"https:\/\/img.freepik.com\/free-icon\/important-person_318-10744.jpg?w=2000\"],\"lastName\":\"Pelleg\",\"created_at\":\"2022-09-19T13:15:28.011Z\"}]}";
      return ResponseWrapper.builder(true, null, response);
    } on DioError catch (error) {
      return ResponseWrapper.fromDioError(error: error);
    } catch (e, s) {
      return ResponseWrapper.fromError(e, s);
    }
  }

  Future<ResponseWrapper> deleteContact({required String contactId}) async {
    try {
      await restClient.deleteContact(contactId);
      return ResponseWrapper.builder(true, null, true);
    } on DioError catch (e) {
      return ResponseWrapper.fromDioError(error: e);
    } catch (e, s) {
      return ResponseWrapper.fromError(e, s);
    }
  }

  Future<ResponseWrapper> operateOnContact(Contact contact,
      {bool edit = false}) async {
    try {
      if (edit) {
        await restClient.editContact(contact.id!);
      } else {
        await restClient.addContact(contact);
      }
      return ResponseWrapper.builder(true, null, true);
    } on DioError catch (e) {
      return ResponseWrapper.fromDioError(error: e);
    } catch (e, s) {
      return ResponseWrapper.fromError(e, s);
    }
  }
}
