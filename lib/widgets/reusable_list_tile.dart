import 'package:flutter/material.dart';

class ReusableListTile extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color textColor;
  final bool hideIcon;

  ReusableListTile({this.title, this.onTap, this.textColor, this.hideIcon = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
          dense: true,
          title: Text(title, style: TextStyle(fontSize: 16.0, color: textColor ?? Colors.black)),
          trailing: hideIcon ? SizedBox() : Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: onTap,
        ),
        Container(height: 1.0, color: Colors.grey.shade300),
      ],
    );
  }
}