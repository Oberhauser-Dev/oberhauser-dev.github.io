import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'illustrations.dart';

class ServicesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Services',
          style: TextStyle( fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        Divider(),
        Text(
          'Illustrations',
          style: TextStyle( fontWeight: FontWeight.normal, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        IllustrationsWidget(),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
