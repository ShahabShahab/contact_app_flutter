import 'package:flutter/material.dart';
import 'package:parsianotp/utils/ui_utils.dart';

class ContactRow extends StatelessWidget {
  const ContactRow(
      {Key? key,
      this.name = "---",
      this.phoneNumber = "---",
      this.picture = "---"})
      : super(key: key);

  final String name, phoneNumber, picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: _buildContactPicture(context),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                buildMargin(height: 20),
                Text(phoneNumber,
                    style: const TextStyle(color: Colors.white, fontSize: 30))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContactPicture(BuildContext context) {
    try {
      return Image.network(picture);
    } catch (e) {
      return Image.asset("avatar.png");
    }
  }
}
