import 'package:doughrise/widgets/reusable_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'accounts.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 24.0),
          _buildTiles(context)
        ],
      )),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 50,
          ),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alex Parish',
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0)),
              SizedBox(height: 4.0),
              Text('alex.parish@gmail.com')
            ],
          )
        ],
      ),
    );
  }

  _buildTiles(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableListTile(
            title: 'Accounts',
            onTap: () => Navigator.push(
                context, CupertinoPageRoute(builder: (context) => Accounts()))),
        ReusableListTile(title: 'Profile'),
        ReusableListTile(title: 'Connect Google Sheets'),
        ReusableListTile(title: 'Invite Friends'),
        SizedBox(height: 64.0),
        ReusableListTile(
            title: 'Log Out', textColor: Colors.red, hideIcon: true),
      ],
    );
  }
}

