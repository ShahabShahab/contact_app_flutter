import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

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
