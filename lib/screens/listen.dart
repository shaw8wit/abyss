import 'package:flutter/material.dart';

class Listen extends StatefulWidget {
  @override
  _ListenState createState() => _ListenState();
}

class _ListenState extends State<Listen> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    controller.reverse(from: 1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: Container(
        decoration: BoxDecoration(
//            color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.55), BlendMode.dstATop),
            image: AssetImage('assets/images/listen.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Text("yo", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  color: Colors.transparent,
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
                    controller.forward(from: 0.0);
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
                    child: const Text('Can\'t', style: TextStyle(fontSize: 20)),
                  ),
                ),
                RaisedButton(
                  color: Colors.transparent,
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
                    controller.forward(from: 0.0);
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
                    child: const Text('Can', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
