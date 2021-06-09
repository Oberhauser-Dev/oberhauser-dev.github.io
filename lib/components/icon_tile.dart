import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IconTileWidget extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final String? url;
  final String? tooltip;

  IconTileWidget(this.iconData, {this.color, this.url, this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 22),
      child: Container(
        child: IconButton(
          padding: EdgeInsets.all(28),
          color: this.color ?? Colors.grey.shade100,
          iconSize: 72,
          icon: Icon(this.iconData),
          onPressed: () {
            if (this.url != null) {
              canLaunch(this.url!).then((value) => launch(this.url!));
            }
          },
          tooltip: tooltip,
        ),
      ),
    );
  }
}
