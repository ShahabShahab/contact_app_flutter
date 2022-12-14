import 'package:flutter/material.dart';
import 'package:contactapp/pages/contact_list/contact_list_page.dart';
import 'package:contactapp/pages/contact_list/contact_list_provider.dart';
import 'package:contactapp/pages/login/login_provider.dart';
import 'package:contactapp/utils/ui_utils.dart';
import 'package:contactapp/widgets/custom_match_parent_button.dart';
import 'package:contactapp/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  late LoginProvider provider;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            label: "User Name",
            error: provider.userNameValidationError,
            onChanged: (value) {
              provider.checkForUserNameTyping(value);
            },
            controller: userNameController,
          ),
          buildMargin(height: 20),
          CustomTextField(
            label: "Password",
            error: provider.passwordValidationError,
            onChanged: (value) {
              provider.checkForPasswordTyping(value);
            },
            controller: passwordController,
          )
        ],
      ),
      bottomNavigationBar: CustomMatchParentButton(
        onPressed: () {
          _login(context);
        },
        title: "Login",
      ),
    );
  }

  void _login(BuildContext context) {
    if (provider.areLoginInputsValid(
        userNameController.text, passwordController.text)) {
      provider.login(userNameController.text, passwordController.text,
          onSuccess: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                      create: (_) => ContactListProvider(),
                      child: ContactListPage(),
                    )));
      }, onError: () {});
    }
  }
}
