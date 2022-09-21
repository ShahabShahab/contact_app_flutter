import 'package:json_annotation/json_annotation.dart';
import 'package:parsianotp/models/contact.dart';

/// _links : [{"rel":"self","href":"https://api.restpoint.io/contacts"},{"rel":"items","href":"https://api.restpoint.io/contacts/{id}"}]
/// count : "3"
/// data : [{"id":"1","firstName":"John","notes":"Very polite guy","phone":"+123456789","email":"email@email.de","picture":["noimg.png"],"lastName":"Doe","created_at":"2022-09-19T12:53:32.224Z"},{"id":"3259b2a2-3bfb-48af-ba26-b1ac8845388a","firstName":"Vall","notes":"Very very","phone":"+987654321","email":"string@email.co","picture":["string"],"lastName":"Evv","created_at":"2022-09-19T13:09:31.228Z"},{"id":"f2068a89-219c-46a3-ae09-c91177fa3316","firstName":"Lorenzo","notes":"Very very","phone":"+11987654321","email":"string@email.be","picture":["https://img.freepik.com/free-icon/important-person_318-10744.jpg?w=2000"],"lastName":"Pelleg","created_at":"2022-09-19T13:15:28.011Z"}]

part 'get_contacts_response.g.dart';

@JsonSerializable(includeIfNull: false)
class GetContactsResponse {
  GetContactsResponse({
      this.links, 
      this.count, 
      this.data,});

  List<Links>? links;
  String? count;
  List<Contact>? data;

  factory GetContactsResponse.fromJson(dynamic json) => _$GetContactsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetContactsResponseToJson(this);

}

/// rel : "self"
/// href : "https://api.restpoint.io/contacts"

@JsonSerializable()
class Links {
  Links({
      this.rel, 
      this.href,});

  String? rel;
  String? href;

  factory Links.fromJson(dynamic json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

}