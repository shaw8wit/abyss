import 'package:abyss/screens/drawer.dart';
import 'package:abyss/screens/login.dart';
import 'package:abyss/screens/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      initialRoute: Auth.routeName,
      routes: {
        Auth.routeName: (context) => Auth(),
        Settings.routeName: (context) => Settings(),
        SideMenu.routeName: (context) => SideMenu(),
      },
    );
  }
}
