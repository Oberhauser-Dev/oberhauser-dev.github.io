import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: SelectableText(
            '''
August Oberhauser
Johann-Clanze-Str. 32,
81369 Munich, Germany
info@oberhauser.dev
oberhauser.dev
    ''',
          ),
        )
      ],
    );
  }
}
