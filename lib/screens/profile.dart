import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedUser;

final _auth = FirebaseAuth.instance;

void getUser() async {
  loggedUser = await _auth.currentUser();
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getUser();
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        children: [
          Spacer(),
          Text(
            "${loggedUser.email}",
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Container(
//              transform: Matrix4.identity()
//                ..translate(-50.0, 120.0)
//                ..rotateZ(-0.4),
            height: MediaQuery.of(context).size.height * 0.68,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Color(0xff32365B).withOpacity(0.85),
            ),
            child: DataStream(),
          ),
        ],
      ),
    );
  }
}

class DataStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('screams').where('author', isEqualTo: loggedUser.email).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent[200],
            ),
          );
        }
        final screams = snapshot.data.documents;
        return ListView.builder(
          itemCount: screams.length,
          itemBuilder: (context, index) {
            final scream = screams[index].data['text'];
            final plus = screams[index].data['plus'];
            final minus = screams[index].data['minus'];
            return Container(
              margin: const EdgeInsets.only(bottom: 10, left: 11, right: 11),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
//                              offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xff32365B).withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("$minus"),
                  backgroundColor: Colors.redAccent,
                ),
                title: AutoSizeText(
                  scream,
                  style: TextStyle(fontSize: 18.0, color: Colors.white.withOpacity(0.85)),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                trailing: CircleAvatar(
                  child: Text("$plus"),
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

//Consumer<Screamlist>(
//builder: (context, screamData, child) {
//return ListView.builder(
//itemCount: screamData.total,
//itemBuilder: (context, index) {
//final scream = screamData.screams[index];
//return Container(
//margin: const EdgeInsets.only(bottom: 10, left: 11, right: 11),
//padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
//decoration: BoxDecoration(
//boxShadow: [
//BoxShadow(
//color: Theme.of(context).primaryColor.withOpacity(0.5),
//spreadRadius: 3,
//blurRadius: 3,
////                              offset: Offset(0, 3), // changes position of shadow
//),
//],
//color: Color(0xff32365B).withOpacity(0.85),
//borderRadius: BorderRadius.circular(20),
//),
//child: ListTile(
//leading: CircleAvatar(
//child: Text("${scream.minus}"),
//backgroundColor: Colors.redAccent,
//),
//title: AutoSizeText(
//scream.text,
//style: TextStyle(fontSize: 18.0, color: Colors.white.withOpacity(0.85)),
//maxLines: 2,
//),
//trailing: CircleAvatar(
//child: Text("${scream.plus}"),
//backgroundColor: Colors.greenAccent,
//),
//),
//);
//},
//);
//},
//),
