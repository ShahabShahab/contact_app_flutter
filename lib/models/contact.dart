import 'package:json_annotation/json_annotation.dart';

/// _id : "string"
/// firstName : "string"
/// lastName : "string"
/// email : "string"
/// notes : "string"
/// picture : ["string"]
/// phone : "string"

part 'contact.g.dart';

@JsonSerializable(includeIfNull: false)
class Contact {
  Contact({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.notes, 
      this.picture, 
      this.phone,});

  String id;
  String firstName;
  String lastName;
  String email;
  String notes;
  List<String> picture;
  String phone;

  factory Contact.fromJson(dynamic json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

}