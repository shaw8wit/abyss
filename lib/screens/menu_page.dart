import 'package:abyss/screens/settings.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'login.dart';

class MenuScreen extends StatelessWidget {
  final int val;
  static const List<MenuItem> options = [
    MenuItem(Icons.account_circle, 'Profile', 1),
    MenuItem(Icons.record_voice_over, 'Shout', 2),
    MenuItem(Icons.hearing, 'Listen', 3),
    MenuItem(Icons.account_balance_wallet, 'Premium', 4),
    MenuItem(Icons.info_outline, 'About', 5),
  ];
  const MenuScreen(this.val);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 58, left: 32, bottom: 8, right: MediaQuery.of(context).size.width / 2.9),
        color: Colors.black,
        height: deviceSize.height > 600 ? deviceSize.height : 600,
        child: Column(
          children: <Widget>[
            Text(
              "Welcome to the Void",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Column(
              children: options.map((item) {
                Color s = item.n == val ? Colors.black : Colors.white;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: item.n == val ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).popAndPushNamed(SideMenu.routeName, arguments: item.n);
                      },
                      leading: Icon(
                        item.icon,
                        color: s,
                        size: 22,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(fontSize: 15, color: s),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(Settings.routeName);
              },
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Settings', style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).popAndPushNamed(Auth.routeName);
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Logout', style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final int n;

  const MenuItem(this.icon, this.title, this.n);
}
