import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const CustomTextField({Key key, this.label, this.controller, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: this.maxLines,
      decoration: InputDecoration(labelText: this.label,),
    );
  }
}
