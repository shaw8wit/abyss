import 'package:flutter/material.dart';

class Premium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(child: Text("Go Pro!", style: TextStyle(color: Colors.black))),
    );
  }
}
