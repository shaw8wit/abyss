import 'package:abyss/screens/about.dart';
import 'package:abyss/screens/listen.dart';
import 'package:abyss/screens/premium.dart';
import 'package:abyss/screens/profile.dart';
import 'package:abyss/screens/settings.dart';
import 'package:abyss/screens/shout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './menu_page.dart';
import './zoom_scaffold.dart';

class SideMenu extends StatefulWidget {
  static const routeName = '/main';
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  MenuController menuController;
  final Map<int, Widget> dis = {
    1: Profile(),
    2: Shout(),
    3: Listen(),
    4: Premium(),
    5: About(),
    6: Settings(),
  };

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int val = ModalRoute.of(context).settings.arguments;
    return ChangeNotifierProvider.value(
      value: menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(val),
        contentScreen: dis[val],
        title: [
          "a",
          "My Profile",
          "Shout into the void",
          "Listen to the void",
          "Go premium",
          "About",
          "Settings"
        ][val],
      ),
    );
  }
}
