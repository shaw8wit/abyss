import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/a.jpg'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Shouvit Pradhan',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade100,
            ),
          ),
          SizedBox(
            height: 25,
            width: 200,
            child: Divider(
              color: Colors.teal[900],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  color: Colors.teal,
                ),
                trailing: Text(
                  '+91 84 5736 7584',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal,
                ),
                trailing: Text(
                  'shaw7wit@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
