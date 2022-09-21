import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? error;
  final TextEditingController controller;
  final int? maxLines;
  final Function(String value) onChanged;

  CustomTextField(
      {Key? key,
      required this.label,
      required this.controller,
      this.maxLines = 1,
      this.error,
      required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          enabled: true,
          onChanged: (value) {
            onChanged(value);
          },
          decoration: InputDecoration(
            labelText: label,
            enabled: false
          ),
        ),
        Visibility(
          visible: error != null,
          child: Text(
            error ?? "",
            style: const TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }
}
