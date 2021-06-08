import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CardWidget extends StatelessWidget {
  final ImageFilter? filter;
  final double width;
  final Widget? child;

  CardWidget({this.filter, this.width = double.infinity, this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridCol(
      md: 12,
      child: Center(
        child: ClipRRect(
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
      ),
    );
  }
}
