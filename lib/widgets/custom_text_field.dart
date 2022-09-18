import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String error;
  final TextEditingController controller;
  final int maxLines;
  final Function(String value) onChanged;

  const CustomTextField(
      {Key key,
      this.label,
      this.controller,
      this.maxLines = 1,
      this.error,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: this.maxLines,
          controller: controller,
          onChanged: (value){
            onChanged(value);
          },
          decoration: InputDecoration(
            labelText: this.label,
          ),
        ),
        Visibility(
          visible: error != null,
          child: Text(
            error ?? "",
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }
}
