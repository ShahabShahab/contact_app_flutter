import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:parsianotp/base_provider.dart';
import 'package:parsianotp/injection_container.dart';
import 'package:parsianotp/models/contact.dart';
import 'package:parsianotp/repos/contacts_repository.dart';

class ContactListProvider extends BaseProvider {
  List<Contact> _contacts = [];
  String _errorMessage = "sdds";
  ContactsRepository repository = sl<ContactsRepository>();

  String get errorMessage => _errorMessage;

  UnmodifiableListView<Contact> get contacts => UnmodifiableListView(_contacts);

  Future<void> getContacts(
      {@required Function(List<Contact> response) onSuccess,
      @required Function(String error) onError}) async {
    var response = await repository.getContacts();
    if (response.ok && response.data != null) {
      onSuccess(response.data);
    } else {
      onError(response.error.message);
    }
  }
}
