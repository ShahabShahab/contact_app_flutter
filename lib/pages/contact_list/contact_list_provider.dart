import 'dart:collection';

import 'package:contactapp/utils/base_provider.dart';
import 'package:contactapp/injection_container.dart';
import 'package:contactapp/models/contact.dart';
import 'package:contactapp/models/get_contacts_response.dart';
import 'package:contactapp/repos/contacts_repository.dart';

class ContactListProvider extends BaseProvider {
  List<Contact> _contacts = [];
  final String _errorMessage = "";
  ContactsRepository repository = sl<ContactsRepository>();

  set contacts(List<Contact> value) {
    _contacts = value;
  }

  String get errorMessage => _errorMessage;

  UnmodifiableListView<Contact> get contacts => UnmodifiableListView(_contacts);

  Future<List<Contact>> getContacts() async {
    var response = await repository.getContacts();
    if (response.ok && response.data != null) {
      _contacts = response.data!.data!;
      return Future.value(response.data!.data!);
    } else {
      return Future.error(response.error!.message!);
    }
  }
}
