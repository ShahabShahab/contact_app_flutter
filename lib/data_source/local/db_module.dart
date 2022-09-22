import 'package:contactapp/constants/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    // if (!Hive.isAdapterRegistered(CONTACTS_ADAPTER_ID))
    //   Hive.registerAdapter<Contact>(ContactAdapter());
    // //add boxes here
    try {
      if (!Hive.isBoxOpen(HAS_USER_ALREADY_LOGGED_IN)) {
        await Hive.openBox<bool>(HAS_USER_ALREADY_LOGGED_IN);
      }
    } catch (e, s) {
      Hive.deleteBoxFromDisk(HAS_USER_ALREADY_LOGGED_IN);
    }
  }
}
