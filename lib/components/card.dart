import 'dart:ui';

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final ImageFilter? filter;
  final double width;
  final Widget? child;

  const CardWidget(
      {Key? key, this.filter, this.width = double.infinity, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: filter != null
                ? BackdropFilter(
                    filter: filter!,
                    child: Container(
                      padding: const EdgeInsets.all(26),
                      alignment: Alignment.topLeft,
                      constraints: BoxConstraints(maxWidth: width),
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: child,
                    ),
                  )
                : child,
          ),
        ],
      ),
    ));
  }
}
