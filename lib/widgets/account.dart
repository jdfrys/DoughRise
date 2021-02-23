import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final String bankName;

  Account({this.bankName});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(24.0),
            title: Text(bankName, style: TextStyle(fontSize: 16.0)),
            subtitle: Text('Just now'),
            leading: Container(
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.red),
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          ),
          Container(height: 1.0, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}