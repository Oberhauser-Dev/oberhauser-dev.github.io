import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IllustrationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 200.0,
              color: Colors.red,
            ),
            Container(
              width: 200.0,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
