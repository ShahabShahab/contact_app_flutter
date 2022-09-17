import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:parsianotp/base_provider.dart';
import 'package:parsianotp/models/contact.dart';

class ContactListProvider extends BaseProvider {
  List<Contact> _contacts = [];
  String _errorMessage = "sdds";

  String get errorMessage => _errorMessage;

  UnmodifiableListView<Contact> get contacts => UnmodifiableListView(_contacts);

  Future<void> getContacts() async {
    debugPrint('ContactListProvider.getContacts');
    // setState(ViewState.LOADING);
    await Future.delayed(Duration(seconds: 3));
    _errorMessage = "sdjhkfjddsf";
    notifyListeners();
  }

  ContactListProvider() {
    debugPrint('ContactListProvider.ContactListProvider');
  }
}
