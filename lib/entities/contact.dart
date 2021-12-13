import 'package:hive/hive.dart';
import 'package:parsianotp/constants/hive_constants.dart';

part 'contact.g.dart';

@HiveType(typeId: CONTACTS_ADAPTER_ID)
class Contact {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  Contact(this.name, this.age);
}
