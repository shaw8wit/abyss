import 'package:abyss/models/screamlist.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Shouvit Pradhan",
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
            child: Consumer<Screamlist>(
              builder: (context, screamData, child) {
                return ListView.builder(
                  itemCount: screamData.total,
                  itemBuilder: (context, index) {
                    final scream = screamData.screams[index];
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
                          child: Text("${scream.minus}"),
                          backgroundColor: Colors.redAccent,
                        ),
                        title: AutoSizeText(
                          scream.text,
                          style: TextStyle(fontSize: 18.0, color: Colors.white.withOpacity(0.85)),
                          maxLines: 2,
                        ),
                        trailing: CircleAvatar(
                          child: Text("${scream.plus}"),
                          backgroundColor: Colors.greenAccent,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
