import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Flushbar showSnackBar(
  BuildContext context,
  String message, {
  Color backgroundColor,
}) {
  return Flushbar(
    animationDuration: Duration(milliseconds: 500),
    messageText: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: Center(
              child: Text(
            message,
            textAlign: TextAlign.center,
          )),
        ),
      ],
    ),
    backgroundColor: backgroundColor ?? Color(0xffCC0000),
    duration: Duration(seconds: 3),
    isDismissible: true,
    dismissDirection: FlushbarDismissDirection.VERTICAL,
  )..show(context);
}

Widget buildMargin({double height = 0, double width = 0}) => SizedBox(
      height: height,
      width: width,
    );

Widget buildLoading() {
  return Scaffold(
    body: Center(
        child: Container(
      child: Lottie.asset('assets/loading.json'),
      height: 200,
      width: 200,
    )),
  );
}

Widget buildTryAgainWidget({String error, VoidCallback onTryAgainClicked}) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          ElevatedButton(style: ButtonStyle(
          ),onPressed: onTryAgainClicked, child: Text("Try Again"))
        ],
      ),
    ),
  );
}
