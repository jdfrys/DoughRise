import 'package:doughrise/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  final List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.attach_money),
      label: 'Budget'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: 'History'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline),
        label: 'Add Transaction'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance),
        label: 'Accounts'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _navBarItems
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Settings', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              child: Settings(),
            );
          }
        );
      },
    );
  }
}

