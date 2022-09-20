import 'package:flutter/material.dart';
import 'package:parsianotp/pages/login/login_provider.dart';
import 'package:parsianotp/ui_utils.dart';
import 'package:parsianotp/widgets/custom_match_parent_button.dart';
import 'package:parsianotp/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  LoginProvider provider;
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
    provider.login(userNameController.text, passwordController.text,
        onSuccess: () {

        }, onError: () {});
  }
}
