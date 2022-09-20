import 'package:flutter/material.dart';
import 'package:parsianotp/data_source/local/db_module.dart';
import 'package:parsianotp/pages/contact_list/contact_list_page.dart';
import 'package:parsianotp/pages/contact_list/contact_list_provider.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await DBModule.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: ChangeNotifierProvider(
            create: (_) => ContactListProvider(),
            child: ContactListPage(),
          )
        ));
  }
}
