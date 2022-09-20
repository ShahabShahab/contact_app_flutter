import 'package:flutter/material.dart';
import 'package:parsianotp/ui_utils.dart';

class ContactRow extends StatelessWidget {
  const ContactRow(
      {Key key,
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
            child: _buildContactPicture(context),
            decoration: BoxDecoration(shape: BoxShape.circle),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  this.name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                buildMargin(height: 20),
                Text(this.phoneNumber,
                    style: TextStyle(color: Colors.white, fontSize: 30))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContactPicture(BuildContext context) {
    // try{
    //   return SvgPicture.network(this.picture);
    // } catch(e){
    //   return SvgPicture.defaultPlaceholderBuilder(context);
    // }
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(shape: BoxShape.circle,
      color: Colors.blueGrey),
    );
  }
}
