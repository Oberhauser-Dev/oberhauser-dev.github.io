import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<Widget> children;
  final scrollController = ScrollController();

  ListViewWidget(this.children);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: Scrollbar(
          thumbVisibility: true,
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            children: this.children,
          ),
        ),
      ),
    );
  }
}
