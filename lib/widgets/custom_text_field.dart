import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String error;
  final TextEditingController controller;
  final int maxLines;
  final Function(String value) onChanged;

  CustomTextField(
      {Key key,
      this.label,
      this.controller,
      this.maxLines = 1,
      this.error,
      this.onChanged})
      : super(key: key){
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          maxLines: this.maxLines,
          controller: controller,
          enabled: true,
          onChanged: (value) {
            onChanged(value);
          },
          decoration: InputDecoration(
            labelText: this.label,
            enabled: false
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
