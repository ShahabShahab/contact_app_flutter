
import 'package:flutter/material.dart';

class CustomMatchParentButton extends StatelessWidget {
  const CustomMatchParentButton(
      {Key key, @required this.onPressed, this.title = "Continue"})
      : super(key: key);

  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: Text(this.title),
      ),
    );
  }
}
