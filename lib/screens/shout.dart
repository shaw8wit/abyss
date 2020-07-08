import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _firestore = Firestore.instance;

FirebaseUser loggedUser;

final _auth = FirebaseAuth.instance;

class Shout extends StatefulWidget {
  @override
  _ShoutState createState() => _ShoutState();
}

class _ShoutState extends State<Shout> with SingleTickerProviderStateMixin {
  AnimationController controller;
  TextEditingController txtController;

  void getUser() async {
    loggedUser = await _auth.currentUser();
  }

  @override
  void initState() {
    getUser();
    txtController = TextEditingController();
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    controller.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: Container(
        decoration: BoxDecoration(
//            color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
            image: AssetImage('assets/images/shout.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            TextField(
              controller: txtController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your words..',
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            RaisedButton(
              color: Colors.transparent,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                _firestore.collection('screams').add({
                  'text': txtController.text,
                  'reacted': ["${prefs.getString('email')}"],
                  'author': loggedUser.email,
                  'plus': 1,
                  'minus': 0
                });
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('The void engulfed your voice!')));
                controller.reverse(from: 1.0);
                txtController.clear();
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xff21254A),
                      Color(0xff292D52),
                      Color(0xff32365B),
                      Color(0xff43476C),
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: const Text('Shout', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
