import 'package:flutter/material.dart';

class Shout extends StatefulWidget {
  @override
  _ShoutState createState() => _ShoutState();
}

class _ShoutState extends State<Shout> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    controller.forward(from: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: RotationTransition(
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
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your words..',
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              RaisedButton(
                color: Colors.transparent,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
                  controller.reverse(from: 1.0);
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
      ),
    );
  }
}
