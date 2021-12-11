import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 20)
class Contact {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  Contact(this.name, this.age);
}
