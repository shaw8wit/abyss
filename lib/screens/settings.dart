import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(child: Text("settings!", style: TextStyle(color: Colors.black))),
    );
  }
}
