import 'package:flutter/material.dart';
import 'package:parsianotp/data_source/local/db_module.dart';
import 'package:parsianotp/data_source/remote/rest_client.dart';
import 'package:parsianotp/injection_container.dart';
import 'package:parsianotp/new_contact_page.dart';
import 'package:parsianotp/post_list_page.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await DBModule.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => sl<RestClient>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewContactPage()));
                },
                child: const Text("Add Contact Page")),
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostListPage()));
                },
                child: const Text("Posts Page")),
          ),
        ],
      ),
    );
  }
}
