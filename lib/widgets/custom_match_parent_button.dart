import 'package:flutter/material.dart';

class CustomMatchParentButton extends StatelessWidget {
  const CustomMatchParentButton(
      {Key? key, required this.onPressed, this.title = "Continue"})
      : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(title),
      ),
    );
  }
}
