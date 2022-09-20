import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parsianotp/pages/contact_list/contact_list_page.dart';
import 'package:parsianotp/pages/contact_list/contact_list_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: hasUserAlreadyLoggedIn(context),
      builder: (context, data) {
          return Scaffold(
            body: Center(
                child: Container(
                  child: Lottie.asset('assets/splash.json'),
                  height: 300,
                  width: 300,
                )),
          );
        }
    );
  }

  Future hasUserAlreadyLoggedIn(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => ContactListProvider(),
              child: ContactListPage(),
            )));
  }
}
