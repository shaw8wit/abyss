import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        height: max(size.height * 0.9, 750),
        child: Column(
          children: <Widget>[
            const Spacer(),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/a.jpg'),
            ),
            const Padding(
              padding: const EdgeInsets.only(top: 18),
              child: const Text(
                'Shouvit Pradhan',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 40,
                  icon: Image.asset('assets/images/linkedin.png'),
                  tooltip: 'LinkedIn',
                  onPressed: () => {_launch('https://www.linkedin.com/in/shaw8wit')},
                ),
                IconButton(
                  iconSize: 35,
                  icon: Image.asset('assets/images/github.png'),
                  tooltip: 'Github',
                  onPressed: () => {_launch('https://www.github.com/shaw8wit')},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: ListTile(
                  onTap: () => {_launch("tel:8250541130")},
                  leading: Icon(
                    Icons.call,
                    color: Colors.teal[700],
                  ),
                  trailing: Text(
                    '+91 82 5054 1130',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal[800],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: ListTile(
                  onTap: () => {_launch('mailto:shaw7wit@gmail.com?subject=Abyss App')},
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal[700],
                  ),
                  trailing: Text(
                    'shaw7wit@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal[800],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.white, thickness: 1),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "This app can be used to let out your thoughts/screams to the void. The void impartially engulfs all the voices. These voices roam around in the void for all of eternity. Try to listen to the void to stumble upon some of the voices let out by many unknown people.",
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Text(
              "*This app is fully private, i.e. any form of contact between users is not possible.\nPlease refrain from passing any hate towards any caste/religion/community.",
              style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 12),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
