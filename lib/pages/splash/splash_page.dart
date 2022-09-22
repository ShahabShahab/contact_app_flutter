import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:contactapp/pages/contact_list/contact_list_page.dart';
import 'package:contactapp/pages/contact_list/contact_list_provider.dart';
import 'package:contactapp/pages/login/login_page.dart';
import 'package:contactapp/pages/login/login_provider.dart';
import 'package:contactapp/pages/splash/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<SplashProvider>(context);
    return FutureBuilder(
        future: hasUserAlreadyLoggedIn(context),
        builder: (context, data) {
          return Scaffold(
            body: Center(
                child: SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset('assets/splash.json'),
            )),
          );
        });
  }

  Future hasUserAlreadyLoggedIn(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    bool hasUserAlreadyLoggedIn = await provider.hasUserAlreadyLoggedIn();
    _navigateToNextPage(hasUserAlreadyLoggedIn, context);
  }

  void _navigateToNextPage(bool hasUserAlreadyLoggedIn, BuildContext context) {
    if (hasUserAlreadyLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (context) => ContactListProvider(),
                    child: ContactListPage(),
                  )));
    }
    else {
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
