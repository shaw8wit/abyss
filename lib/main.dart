import 'package:abyss/models/screamlist.dart';
import 'package:abyss/screens/drawer.dart';
import 'package:abyss/screens/login.dart';
import 'package:abyss/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Screamlist()),
      ],
      child: ChangeNotifierProvider.value(
        value: Screamlist(),
        child: MaterialApp(
//      showPerformanceOverlay: true,
          debugShowCheckedModeBanner: false,
          title: 'ABYSS',
          theme: ThemeData(
            fontFamily: 'NunitoSans',
            primaryColor: Color(0xff21254A),
            scaffoldBackgroundColor: Colors.black,
          ),
          initialRoute: Auth.routeName,
          routes: {
            Auth.routeName: (context) => Auth(),
            Settings.routeName: (context) => Settings(),
            SideMenu.routeName: (context) => SideMenu(),
          },
        ),
      ),
    );
  }
}
