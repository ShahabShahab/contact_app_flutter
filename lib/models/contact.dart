import 'package:json_annotation/json_annotation.dart';

/// id : "1"
/// firstName : "John"
/// notes : "Very polite guy"
/// phone : "+123456789"
/// email : "email@email.de"
/// picture : ["noimg.png"]
/// lastName : "Doe"
/// created_at : "2022-09-19T12:53:32.224Z"

part 'contact.g.dart';

@JsonSerializable(includeIfNull: false)
class Contact {
  Contact({
      this.id, 
      this.firstName, 
      this.notes, 
      this.phone, 
      this.email, 
      this.picture, 
      this.lastName, 
      this.createdAt,});

  String? id;
  String? firstName;
  String? notes;
  String? phone;
  String? email;
  List<String>? picture;
  String? lastName;
  String? createdAt;

  factory Contact.fromJson(dynamic json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

}