import 'package:flutter/material.dart';

class ContactRow extends StatelessWidget {
  const ContactRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Picture Placeholder"),
        Column(
          children: [Text("Bodoni Ornaments"), Text("Phone Number")],
        )
      ],
    );
  }
}
