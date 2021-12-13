import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parsianotp/constants/hive_constants.dart';
import 'package:parsianotp/entities/contact.dart';

class DBModule {
  DBModule() {
    initDb();
  }

  static initDb() async {
    try {
      await Hive.initFlutter();
    } catch (e, s) {
      Hive.deleteFromDisk();
    }
    if (!Hive.isAdapterRegistered(CONTACTS_ADAPTER_ID))
      Hive.registerAdapter<Contact>(ContactAdapter());
    //add boxes here
    try {
      if (!Hive.isBoxOpen(CONTACTS_BOX_NAME))
        await Hive.openBox<Contact>(CONTACTS_BOX_NAME);
    } catch (e, s) {
      Hive.deleteBoxFromDisk(CONTACTS_BOX_NAME);
    }
  }
}
