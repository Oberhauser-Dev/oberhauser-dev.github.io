import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final ImageFilter? filter;
  final double width;
  final Widget? child;

  CardWidget({this.filter, this.width = double.infinity, this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: this.filter != null
                ? BackdropFilter(
                    filter: this.filter!,
                    child: Container(
                      padding: EdgeInsets.all(26),
                      alignment: Alignment.topLeft,
                      constraints: BoxConstraints(maxWidth: width),
                      decoration: new BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: this.child,
                    ),
                  )
                : this.child,
          ),
        ],
      ),
    ));
  }
}
