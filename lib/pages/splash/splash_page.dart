import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parsianotp/pages/contact_list/contact_list_page.dart';
import 'package:parsianotp/pages/contact_list/contact_list_provider.dart';
import 'package:parsianotp/pages/login/login_page.dart';
import 'package:parsianotp/pages/login/login_provider.dart';
import 'package:parsianotp/pages/splash/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  late SplashProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<SplashProvider>(context);
    return FutureBuilder(
        future: hasUserAlreadyLoggedIn(context),
        builder: (context, data) {
          return Scaffold(
            body: Center(
                child: Container(
              child: Lottie.asset('assets/splash.json'),
              height: 300,
              width: 300,
            )),
          );
        });
  }

  Future hasUserAlreadyLoggedIn(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    bool hasUserAlreadyLoggedIn = await provider.hasUserAlreadyLoggedIn();
    if (hasUserAlreadyLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (context) => ContactListProvider(),
                    child: ContactListPage(),
                  )));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (context) => LoginProvider(),
                    child: LoginPage(),
                  )));
    }
  }
}
